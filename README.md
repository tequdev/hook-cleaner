# Hook Cleaner

## Overview

Hook Cleaner removes unwanted compiler-provided exports and functions from a wasm binary to make it (more) suitable for being used as a Hook

## Installation

To install the latest release binary:

```bash
curl -fsSL https://raw.githubusercontent.com/Xahau/hook-cleaner/main/install.sh | bash
```

Or download and run manually:

```bash
curl -fsSL https://raw.githubusercontent.com/Xahau/hook-cleaner/main/install.sh -o install.sh
chmod +x install.sh
./install.sh
```

The script will automatically detect your OS, architecture, and libc type, then download and install the appropriate binary.

You can specify a custom installation directory using the `INSTALL_DIR` environment variable:

```bash
INSTALL_DIR=$HOME/.local/bin ./install.sh
```

## Setup

### Cloning the Repository

When cloning for the first time, include submodules:

```bash
git clone git@github.com:Xahau/hook-cleaner.git
```

### Local Build

To build locally:

```bash
make
```

## Release Process

1. Create and push a git tag:
   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```

2. GitHub Actions will automatically build binaries for the following platforms:
   - **Linux**: x64 (gnu/musl), arm64 (gnu/musl), x86 (gnu/musl), arm (gnu/musl)
   - **macOS**: x64, arm64

3. Once the build completes, a GitHub Release will be automatically created and all binaries will be uploaded.

## Binary Naming Convention

Binary names follow the format below:

- Linux: `hook-cleaner-linux-{arch}-{libc}`
  - Examples: `hook-cleaner-linux-x64-gnu`, `hook-cleaner-linux-arm64-musl`
- macOS: `hook-cleaner-macos-{arch}`
  - Examples: `hook-cleaner-macos-x64`, `hook-cleaner-macos-arm64`

## Supported Platforms

| OS | Architecture | Libc | Binary Name |
|---|---|---|---|
| Linux | x64 | gnu | `hook-cleaner-linux-x64-gnu` |
| Linux | x64 | musl | `hook-cleaner-linux-x64-musl` |
| Linux | arm64 | gnu | `hook-cleaner-linux-arm64-gnu` |
| Linux | arm64 | musl | `hook-cleaner-linux-arm64-musl` |
| Linux | x86 | gnu | `hook-cleaner-linux-x86-gnu` |
| Linux | x86 | musl | `hook-cleaner-linux-x86-musl` |
| Linux | arm | gnu | `hook-cleaner-linux-arm-gnu` |
| Linux | arm | musl | `hook-cleaner-linux-arm-musl` |
| macOS | x64 | - | `hook-cleaner-macos-x64` |
| macOS | arm64 | - | `hook-cleaner-macos-arm64` |

