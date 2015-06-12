# Graphene for Lua
![shield_license]
![shield_build]
![shield_tests]

![shield_release_version]
![shield_prerelease_version]
![shield_dev_version]

Graphene is a library intended to make creation of large Lua libraries easier by providing a common structure to handle library includes in a sane way. It provides namespacing semantics similar to .NET that map directly to the filesystem and provides a large amount of platform feature detection.

To create a library intended for use with Graphene, rename `graphene.lua` to `init.lua` and put it in your library's root folder. Then, when the folder containing your library is loaded, a Graphene namespace will be returned that handles loading the rest of your library. What used to be `init.lua` in a library should then become `_.lua`, which is automatically loaded by Graphene to initialize directories.

See [Rationale](docs/rationale.md) for an argument for, and potentially against Graphene.

## Support
Graphene presently runs under the following platforms natively:
- Lua 5.1
- Lua 5.2/5.3 with debug library
- LuaJIT 2.0+
- LÖVE 0.9.0+

LuaFileSystem is required for advanced filesystem features like directory listing and directory importing. On 5.2 and 5.3, the debug library is required for imports to function due to changes in the environment system.

Any platforms not officially supported can use the included virtual filesystem, which can also be used to pack a library up into a single file. This functionality is deprecated, however, and will be included instead as an extra in a future version of Graphene.

## Feature Detection
Graphene feature detects for the following features and exposes them through `Graphene.Support`:
- Lua 5.1, 5.2, 5.3+ (`lua51`, `lua52`, `lua53`)
- LuaJIT 2.0+ (`luajit` in 1.1.9+)
- LÖVE 0.9.0+ (`love`)
- Debug library (`debug`)
- IO library (`io`)
- OS library (`os`)
- LuaFileSystem (`lfs`)
- LuaJIT FFI / LuaFFI (`ffi`)
- xpcall with passthrough arguments (`xpcallargs`)

## Simple Usage

Libraries using Graphene will have a source similar to:

library/one.lua:
```lua
local library = (...)
local two = library.two

local one = {
	name = "one"
}

return one
```

And then code using the library would look like this:

```lua
local library = require("library")
print(library.one.name) --> one
```

[shield_license]: https://img.shields.io/badge/license-zlib/libpng-333333.svg?style=flat-square
[shield_build]: https://img.shields.io/badge/build-unknown-lightgrey.svg?style=flat-square
[shield_tests]: https://img.shields.io/badge/tests-0/0-lightgrey.svg?style=flat-square
[shield_release_version]: https://img.shields.io/badge/release-1.1.11-brightgreen.svg?style=flat-square
[shield_prerelease_version]: https://img.shields.io/badge/prerelease-none-lightgrey.svg?style=flat-square
[shield_dev_version]: https://img.shields.io/badge/development-2.0.0-orange.svg?style=flat-square