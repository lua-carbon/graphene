# Graphene for Lua
![shield_license]
![shield_build]
![shield_tests]

![shield_release_version]
![shield_prerelease_version]
![shield_dev_version]

Graphene is a library intended to make creation of large Lua libraries easier by providing a common structure to handle library includes in a sane way. It provides namespacing semantics similar to .NET that map directly to the filesystem.

Graphene obsoletes `lcore` but does not necessarily replace it: Graphene takes place of the lcore core, with new libraries planned to replace what was once core.

To create a library intended for use with Graphene, make the init.lua of the root folder contain the contents of `graphene.lua`. Then, when the folder containing your library is required, a Graphene namespace will be returned that facilitates loading the rest of your library. What used to be `init.lua` in a library should then become `_.lua`, which is automatically loaded by Graphene to initialize directories.

## Support
Graphene presently runs under the following platforms natively:
- Lua 5.1+ with or without LuaFileSystem
- LuaJIT 2.0+
- LÖVE 0.9.0+

Any platforms not officially supported can use the included virtual filesystem, which can also be used to pack a library up into a single file.

## Sample Usage

Objects loaded through Graphene will have a source something like this:

```lua
-- library/one.lua
local library = (...)
local two = library.two

local one = {
	name = "one"
}

return one
```

And then code using the library can look like this:

```lua
local library = require("library")
print(library.one.name) --> one
```

[shield_license]: https://img.shields.io/badge/license-zlib/libpng-333333.svg?style=flat-square
[shield_build]: https://img.shields.io/badge/build-unknown-lightgrey.svg?style=flat-square
[shield_tests]: https://img.shields.io/badge/tests-0/0-lightgrey.svg?style=flat-square
[shield_release_version]: https://img.shields.io/badge/release-1.0.1-brightgreen.svg?style=flat-square
[shield_prerelease_version]: https://img.shields.io/badge/prerelease-1.1.0--alpha-blue.svg?style=flat-square
[shield_dev_version]: https://img.shields.io/badge/development-1.1.0-orange.svg?style=flat-square