#!/bin/sh
# Fail if the built binary's architecture/libc does not match the asset name.
# Usage: check-binary-arch.sh <binary> <os_name> <arch> <libc>
set -eu

BIN="${1:?binary path required}"
OS_NAME="${2:?os_name required}"
ARCH="${3:?arch required}"
LIBC="${4:-}"

if [ ! -f "$BIN" ]; then
  echo "error: binary not found: $BIN" >&2
  exit 1
fi

FILE_OUT=$(file "$BIN")
echo "file: $FILE_OUT"

case "$ARCH" in
  x64)
    echo "$FILE_OUT" | grep -Eqi 'x86-64|x86_64' || {
      echo "error: expected x86-64/x86_64 in file(1) output" >&2
      exit 1
    }
    ;;
  arm64)
    echo "$FILE_OUT" | grep -Eqi 'aarch64|arm64' || {
      echo "error: expected aarch64/arm64 in file(1) output" >&2
      exit 1
    }
    ;;
  *)
    echo "error: unknown arch: $ARCH" >&2
    exit 1
    ;;
esac

INTERP=""
if [ "$OS_NAME" = "linux" ] && command -v readelf >/dev/null 2>&1; then
  READELF_H=$(readelf -h "$BIN")
  echo "$READELF_H" | grep -E 'Class:|Machine:'
  MACHINE=$(echo "$READELF_H" | sed -n 's/^[[:space:]]*Machine:[[:space:]]*//p')
  case "$ARCH" in
    x64)
      echo "$MACHINE" | grep -Eq 'X86-64|x86-64' || {
        echo "error: readelf Machine is not X86-64 (got: $MACHINE)" >&2
        exit 1
      }
      ;;
    arm64)
      echo "$MACHINE" | grep -q 'AArch64' || {
        echo "error: readelf Machine is not AArch64 (got: $MACHINE)" >&2
        exit 1
      }
      ;;
  esac
  INTERP=$(readelf -l "$BIN" | sed -n 's/.*Requesting program interpreter: \([^]]*\).*/\1/p' | tr -d ' ')
  echo "interpreter: ${INTERP:-none}"
fi

if [ "$OS_NAME" = "linux" ]; then
  case "$LIBC" in
    gnu)
      echo "$FILE_OUT" | grep -qi 'dynamically linked' || {
        echo "error: gnu binary must be dynamically linked" >&2
        exit 1
      }
      echo "$FILE_OUT $INTERP" | grep -q 'ld-linux' || {
        echo "error: gnu binary must use ld-linux" >&2
        exit 1
      }
      echo "$FILE_OUT $INTERP" | grep -q 'ld-musl' && {
        echo "error: gnu binary must not be musl" >&2
        exit 1
      }
      ;;
    musl)
      echo "$FILE_OUT $INTERP" | grep -q 'ld-linux' && {
        echo "error: musl binary must not use ld-linux (got glibc interpreter)" >&2
        exit 1
      }
      if echo "$FILE_OUT" | grep -qi 'statically linked'; then
        echo "musl: statically linked"
      elif echo "$FILE_OUT $INTERP" | grep -Eq 'ld-musl|[[:space:]]musl'; then
        echo "musl: ld-musl / file says musl"
      else
        echo "error: musl binary must be ld-musl or statically linked" >&2
        exit 1
      fi
      ;;
    *)
      echo "error: unknown linux libc: ${LIBC:-empty}" >&2
      exit 1
      ;;
  esac
elif [ "$OS_NAME" = "macos" ]; then
  echo "$FILE_OUT" | grep -q 'Mach-O' || {
    echo "error: macos binary must be Mach-O" >&2
    exit 1
  }
  case "$ARCH" in
    x64)
      echo "$FILE_OUT" | grep -Eqi 'x86_64' || {
        echo "error: macos x64 must be x86_64 Mach-O" >&2
        exit 1
      }
      ;;
    arm64)
      echo "$FILE_OUT" | grep -Eqi 'arm64' || {
        echo "error: macos arm64 must be arm64 Mach-O" >&2
        exit 1
      }
      ;;
  esac
else
  echo "error: unknown os_name: $OS_NAME" >&2
  exit 1
fi

echo "arch check passed: $BIN ($OS_NAME $ARCH ${LIBC:-nolibc})"
