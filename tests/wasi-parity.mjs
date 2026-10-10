// Verify the reactor-model WASI build produces byte-identical output to the native binary.
// Usage: node tests/wasi-parity.mjs <hook-cleaner.wasm> <native hook-cleaner>
import { readFileSync, readdirSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
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

let failed = 0;
for (const name of readdirSync(dir).filter((n) => n.endsWith('.wasm')).sort()) {
  const input = readFileSync(join(dir, name));
  const inp = malloc(input.length);
  const out = malloc(input.length * 2);
  const lenPtr = malloc(4);
  new Uint8Array(memory.buffer).set(input, inp);
  new DataView(memory.buffer).setInt32(lenPtr, input.length, true);
  const rc = cleaner(inp, out, lenPtr);
  const outLen = new DataView(memory.buffer).getInt32(lenPtr, true);
  const got = Buffer.from(new Uint8Array(memory.buffer, out, outLen));
  const expected = execFileSync(nativeBin, ['-', '-'], { input, stdio: ['pipe', 'pipe', 'ignore'] });
  const ok = rc === 0 && got.equals(expected);
  if (!ok) failed++;
  console.log(`${ok ? 'PASS' : 'FAIL'} ${name} (rc=${rc}, ${input.length} -> ${outLen} bytes)`);
}
if (failed) {
  console.error(`${failed} test(s) differ from native output`);
  process.exit(1);
}
console.log('wasm output matches native output for all tests');
