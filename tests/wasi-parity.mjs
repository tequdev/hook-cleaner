// Verify the reactor-model WASI build produces byte-identical output to the native binary.
// Usage: node tests/wasi-parity.mjs <hook-cleaner.wasm> <native hook-cleaner>
import { readFileSync, readdirSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import { dirname, join } from 'node:path';
import { WASI } from 'node:wasi';

const [wasmPath, nativeBin] = process.argv.slice(2);
const dir = dirname(new URL(import.meta.url).pathname);

// The host shim in hooks-compiler / Hooks IDE only provides these imports.
const ALLOWED_IMPORTS = ['fd_write', 'fd_close', 'fd_seek', 'fd_prestat_get', 'fd_prestat_dir_name', 'proc_exit'];
const module = await WebAssembly.compile(readFileSync(wasmPath));
const unexpected = WebAssembly.Module.imports(module)
  .filter((i) => i.module !== 'wasi_snapshot_preview1' || !ALLOWED_IMPORTS.includes(i.name));
if (unexpected.length) {
  console.error('unexpected imports:', unexpected);
  process.exit(1);
}

const wasi = new WASI({ version: 'preview1' });
const instance = await WebAssembly.instantiate(module, wasi.getImportObject());
wasi.initialize(instance);
const { memory, malloc, cleaner } = instance.exports;

// Hosts allocate `out` as 2*len; the canary after that bound must survive the call.
const CANARY = Buffer.alloc(16, 0xaa);

function runWasm(input) {
  const inp = malloc(input.length);
  const bound = input.length * 2;
  const out = malloc(bound + CANARY.length);
  const lenPtr = malloc(4);
  new Uint8Array(memory.buffer).set(input, inp);
  new Uint8Array(memory.buffer).set(CANARY, out + bound);
  new DataView(memory.buffer).setInt32(lenPtr, input.length, true);
  let rc;
  try {
    rc = cleaner(inp, out, lenPtr);
  } catch (e) {
    // node:wasi (returnOnExit) throws its private exit-code key from proc_exit; the code is stored under it.
    if (typeof e !== 'symbol') throw e;
    rc = wasi[e];
  }
  const outLen = new DataView(memory.buffer).getInt32(lenPtr, true);
  const mem = new Uint8Array(memory.buffer);
  return {
    rc,
    outLen,
    out: Buffer.from(mem.subarray(out, out + outLen)),
    canaryOk: Buffer.from(mem.subarray(out + bound, out + bound + CANARY.length)).equals(CANARY),
  };
}

function runNative(input) {
  const r = spawnSync(nativeBin, ['-', '-'], { input, stdio: ['pipe', 'pipe', 'ignore'] });
  return { rc: r.status, out: r.stdout };
}

const cases = readdirSync(dir).filter((n) => n.endsWith('.wasm')).sort()
  .map((name) => ({ name, input: readFileSync(join(dir, name)) }));
// Rejected inputs: cleaner() returns non-zero for a bad magic number, and exit(100)s (proc_exit)
// on a LEB128 overflow. The exit case runs last because libc has torn down after exit().
cases.push({ name: 'reject: bad magic', input: Buffer.from('not a wasm file'), rejected: true });
cases.push({ name: 'reject: LEB128 overflow', input: Buffer.from('0061736d0100000000' + 'ff'.repeat(16), 'hex'), rejected: true });

let failed = 0;
for (const { name, input, rejected } of cases) {
  const w = runWasm(input);
  const n = runNative(input);
  const ok = w.rc === n.rc && (n.rc !== 0) === !!rejected && w.canaryOk
    && (w.rc !== 0 || (w.outLen <= input.length * 2 && w.out.equals(n.out)));
  if (!ok) failed++;
  console.log(`${ok ? 'PASS' : 'FAIL'} ${name} (rc=${w.rc}, native rc=${n.rc}, ${input.length} -> ${w.outLen} bytes${w.canaryOk ? '' : ', canary clobbered'})`);
}
if (failed) {
  console.error(`${failed} test(s) differ from native output`);
  process.exit(1);
}
console.log('wasm output matches native output for all tests');
