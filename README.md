# ObjGTK4

GTK4 bindings for Objective C utilizing ObjFW. These files are generated by objgtkgen and patched to compile
and provide a (more or less) sensible API.

This library set is meant to work with the versions delivered with Ubuntu 24.04 / elementary OS 8.

## Build dependencies

- [OGObject (latest)](https://codeberg.org/ObjGTK/OGObject) and its dependencies
- [OGio (latest)](https://codeberg.org/ObjGTK/OGio) and its dependencies

## Install

Autogen, configure, make, make install in this order:

1. OGPango
2. OGGdkPixpuf
3. OGdk4
4. OGsk4
5. ObjGTK4

Or use `Install.sh` to make and install them one after another. You will have to clean manually.

See [this Codeberg repo](https://codeberg.org/ObjGTK/ObjGTK4SmallExampleApp) for current usage and a small example app.