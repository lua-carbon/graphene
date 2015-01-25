--[[
	VFS Test
]]

local N = require("namespace")
local core = N:GetNamespaceCore()
local vfs = core.FS:GetProvider("vfs")

vfs:AddDirectory("Test")
vfs:AddFile("Test._", "return {Name = \"Test\"}")
vfs:AddFile("Test.Hello", "return {Name = \"Hello\"}")

assert(N.Test, "Could not add directory 'Test'")
assert(N.Test.Name == "Test", "_ was not loaded for 'Test'")
assert(N.Test.Hello, "Hello was not loaded")
assert(N.Test.Hello.Name == "Hello", "Hello did not load properly.")