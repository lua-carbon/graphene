# Namespace for Lua
Namespace is a library intended to make creation of large Lua libraries easier by providing a common structure to handle library includes in a sane way. It presently runs with Lua 5.1, 5.2, 5.3, and LuaJIT, and requires either LuaFileSystem or LÖVE 0.9.0+. An interface without LuaFileSystem is planned soon, as is a native interface for ROBLOX. Any platforms not supported can use the included virtual filesystem, which will allow developers to compile their libraries to a single file and keep the same semantics.

Namespace obsoletes `lcore` but does not necessarily replace it: Namespace takes place of the lcore core, with new libraries planned to replace what was once core.

To create a library intended for use with Namespace, make the init.lua of the root folder contain the contents of `namespace.lua`. When `N.config.lib` is set to `true`, which is the default, the namespace will be returned by init.