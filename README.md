# ObjGTK4

GTK4 bindings for Objective C utilizing ObjFW. These files are generated by objgtkgen and patched to compile
and provide a (more or less) sensible API.

This library set is meant to work with the versions delivered with Ubuntu 24.04 (elementary OS 8).

## Build dependencies

- gcc/clang
- pkg-config
- [ObjFW](https://objfw.nil.im/) (latest release)
- [OGObject](https://codeberg.org/ObjGTK/OGObject) (latest release)
- [OGio](https://codeberg.org/ObjGTK/OGio) (latest release)

### Debian / Ubuntu

- `sudo apt install make autoconf pkg-config clang-format clang-tidy clang-tools clang clangd libclang1 lld lldb llvm-runtime llvm`

## Install

Autogen, configure, make, make install in this order:

1. OGPango
2. OGGdkPixpuf
3. OGdk4
4. OGsk4
5. ObjGTK4

See [this Codeberg repo](https://codeberg.org/ObjGTK/ObjGTK4SmallExampleApp) for current usage and a small example app.