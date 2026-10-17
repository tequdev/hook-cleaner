# Delete a target whose recipe failed part-way (e.g. clang succeeded but wasm-opt is missing),
# so a second make does not report the half-built file as up to date.
.DELETE_ON_ERROR:
CC ?= gcc
all: hook-cleaner
hook-cleaner: cleaner.c
	$(CC) -g cleaner.c -o hook-cleaner
install: hook-cleaner
	cp hook-cleaner /usr/bin/

# Release builds use wasi-sdk 34 and binaryen 133 (see .github/workflows/release.yml).
# Keep binaryen first on PATH: clang also runs wasm-opt from PATH at link time.
WASI_CLANG ?= clang
WASM_OPT ?= wasm-opt
# wasm-opt (binaryen) is required: it removes the unreachable stdio-lock path, which
# otherwise imports clock_time_get that the embedding hosts' WASI shim does not provide.
hook-cleaner.wasm: cleaner.c
	$(WASI_CLANG) --target=wasm32-wasip1 -O2 -w -mexec-model=reactor -Wl,--export=cleaner,--export=malloc,--export=free cleaner.c -o $@
	$(WASM_OPT) -O2 $@ -o $@
