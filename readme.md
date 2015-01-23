# Namespace for Lua
Namespace is a library intended to make creation of large Lua libraries easier by providing a common structure to handle library includes in a sane way. It presently runs with Lua 5.1, 5.2, 5.3, and LuaJIT, and requires either LuaFileSystem or LÖVE 0.9.0+. An interface without LuaFileSystem is planned soon, as is a native interface for ROBLOX. Any platforms not supported can use the included virtual filesystem, which will allow developers to compile their libraries to a single file and keep the same semantics.

Namespace obsoletes `lcore` but does not necessarily replace it: Namespace takes place of the lcore core, with new libraries planned to replace what was once core.

To create a library intended for use with Namespace, make the init.lua of the root folder contain the contents of namespace.lua, then change the last lines of the file to look like this:

```lua
-- Load the current directory as a namespace
local lib = N:get("libraryname")

-- Yield the namespace to the calling code
return lib
```

Where `libraryname` is the name of the folder containing the library, but nothing else. By default, Namespace loads files relative to the folder above the current path. If Namespace is loaded using Lua's `init.lua` mechanism (`require("libraryname")`), this will be the folder above the folder containing `init.lua`. Otherwise, the directory will be the directory containing the Namespace source file. This will hopefully be simplified in a future version.