# Namespace for Lua
Namespace is a library intended to make creation of large Lua libraries easier by providing a common structure to handle library includes in a sane way. It presently runs with Lua 5.1, 5.2, 5.3, and LuaJIT, and requires either LuaFileSystem or LÖVE 0.9.0+. An interface without LuaFileSystem is planned soon, as is a native interface for ROBLOX. Any platforms not supported can use the included virtual filesystem, which will allow developers to compile their libraries to a single file and keep the same semantics.

Namespace obsoletes `lcore` but does not necessarily replace it: Namespace takes place of the lcore core, with new libraries planned to replace what was once core.

To create a library intended for use with Namespace, make the init.lua of the root folder contain the contents of `namespace.lua`. When `N.Config.Lib` is set to `true`, which is the default, the namespace will be returned by init. The core can still be retrieved with this setting from any namespace directory using `Directory:GetNamespaceCore()`.

Objects loaded through Namespace will have a source something like this:

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