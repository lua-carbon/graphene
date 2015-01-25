# Graphene for Lua
Graphene is a library intended to make creation of large Lua libraries easier by providing a common structure to handle library includes in a sane way. It provides namespacing semantics similar to .NET that map directly to the filesystem.

Graphene obsoletes `lcore` but does not necessarily replace it: Graphene takes place of the lcore core, with new libraries planned to replace what was once core.

To create a library intended for use with Graphene, make the init.lua of the root folder contain the contents of `namespace.lua`. When `N.Config.Lib` is set to `true`, which is the default, the namespace will be returned by init. The core can still be retrieved with this setting from any namespace directory using `Directory:GetGrapheneCore()`.

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

And then an object using the library can have code like this:

```lua
local library = require("library")
print(library.one.name) --> one
```