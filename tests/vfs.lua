--[[
	VFS Test
]]

local N = require("namespace")
local core = N:GetNamespaceCore()
local vfs = core.FS:GetProvider("vfs")



vfs:AddDirectory("Test")
vfs:AddFile("Test._", "return {Name = \"Test\"}")
vfs:AddFile("Test.Hello", "(...).HelloFlag = true; return {Name = \"Hello\"}")

local Test = N.Test
Test:FullyLoad()

assert(N.HelloFlag, "FullyLoad failed to load Test.Hello")

assert(N.Test, "Could not add directory 'Test'")
assert(N.Test.Name == "Test", "_ was not loaded for 'Test'")
assert(N.Test.Hello, "Hello was not loaded")
assert(N.Test.Hello.Name == "Hello", "Hello did not load properly.")