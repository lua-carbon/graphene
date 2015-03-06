# Rationale for Graphene
So, you have a project, potentially a library, and it has lots of files. You want users to be able to access individual pieces of the library, too, and have complex interdependencies between all the files.

With Lua, you have a couple options:

**1. Assume that a user will always have the same path to your library.**

This lets you have friendly include paths internally.

Library code:
```lua
local x = require("mylib.x")
local y = require("mylib.y")
local MyLib = {}

MyLib.x = x
MyLib.y = y

return MyLib
```

User code:
```lua
local mylib = require("mylib")
local x = require("mylib.x")
local y = require("mylib.y")

print(x, y)

...
```

Pros:
- No dependencies
- Simple

Cons:
- Inability to relocate library without modifying large amounts of code
- Users have to require modules individually
- To implement namespace functionality, lists of folders and their contents have to be kept

**2. Use a pattern at the head of every file with PHP-style includes.**

This solves one of the shortcomings of the previous method: your library can be put anywhere and it'll still work!

Library code:
```lua
local root = (...):gsub('%.[^%.]+$', '') .. "."
local x = require(root .. "x")
local y = require(root .. "y")
local MyLib = {}

MyLib.x = x
MyLib.y = y

return MyLib
```

User code:
```lua
local mylib = require("mylib")
local x = require("mylib.x")
local y = require("mylib.y")

print(x, y)

...
```

Pros:
- Still no dependencies
- Simple usage (except perhaps for the initial design of the pattern)

Cons:
- Copy+paste pattern to the top of every file
- Concatenation within `require` syntax not very semantic
- Users have to require modules individually
- To implement namespace functionality, lists of folders and their contents have to be kept

**3. Use a library loading library, like Graphene!**

Graphene is a large library, but the features it provides are unparalleled.

Library code:
```lua
local lib = (...)
local MyLib = {}

-- We don't have to manually link to our submodules!
-- To access them, we can use:
print(lib.x, lib.y)

return MyLib
```

User code:
```lua
local mylib = require("mylib")

print(mylib.x, mylib.y)

...
```

Alternative user code:
```lua
-- No pollution of global variables done
require("mylib"):Import("x", "y")

print(x, y)

...
```

Pros:
- No boilerplate!
- Simple setup
- Clean, filesystem-correlated namespaces
- Extra features!
	- Metadata infrastructure for modules and their contents
	- Language extension capabilities
	- LFS integration for directory listing, module listing, and dynamic loading
	- Library import via Directory and Importable objects
	- Built-in filesystem abstraction for all platforms and virtual filesystem
	- Submodules: run Graphene libraries inside of eachother with no code changes
	- Deep introspective facilities: hook into loads and errors, use safe mode to probe for modules
	- Configurable: change everything at runtime

Cons:
- Rather large (~1600 lines at the time of writing)
- Complex, but tests partially alleviate the potential of bugs slipping in

Do these pros outweigh the cons? Depends on philosophy!

Graphene is targeted at those comfortable with module-centered platforms like C#, but should also be comfortable for users who have used Python, Java, or most languages with module support.