CC ?= gcc
all: hook-cleaner
hook-cleaner: cleaner.c
	$(CC) -g cleaner.c -o hook-cleaner
install: hook-cleaner
	cp hook-cleaner /usr/bin/

WASI_CLANG ?= clang
# wasm-opt (binaryen) is required: it removes the unreachable stdio-lock path, which
# otherwise imports clock_time_get that the embedding hosts' WASI shim does not provide.
hook-cleaner.wasm: cleaner.c
	$(WASI_CLANG) --target=wasm32-wasip1 -O2 -w -mexec-model=reactor -Wl,--export=cleaner,--export=malloc,--export=free cleaner.c -o $@
	wasm-opt -O2 $@ -o $@
