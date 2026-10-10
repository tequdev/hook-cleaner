CC ?= gcc
all: hook-cleaner
hook-cleaner: cleaner.c
	$(CC) -g cleaner.c -o hook-cleaner
install: hook-cleaner
	cp hook-cleaner /usr/bin/

WASI_CLANG ?= clang
hook-cleaner.wasm: cleaner.c
	$(WASI_CLANG) --target=wasm32-wasip1 -O2 -w -mexec-model=reactor -Wl,--export=cleaner,--export=malloc,--export=free cleaner.c -o $@
