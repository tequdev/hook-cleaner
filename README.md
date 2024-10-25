# Hook Cleaner
Hook Cleaner removes unwanted compiler-provided exports and functions from a wasm binary to make it (more) suitable for being used as a Hook

## WIP
This project is still being debugged

## Install

```bash
brew tap tequdev/tap
brew install tequdev/tap/hook-cleaner
```

## Use

```bash
hook-cleaner accept.wasm
```

## Requirements
None, as long as you have any version of
* gcc
* make

from the past 15 years you can build this.

## Build
```bash
git clone https://github.com/RichardAH/hook-cleaner-c.git
cd hook-cleaner-c
make
```


