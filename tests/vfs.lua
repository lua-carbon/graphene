--[[
	Graphene VFS Test
]]

local Graphene = require("graphene")
local G = Graphene:GetGrapheneCore()
local vfs = G.FS:GetProvider("vfs")

-- Basic write
vfs:AddDirectory("Test")
vfs:AddFile("Test._", [[ return {Name = "Test"} ]])
vfs:AddFile("Test.Hello", [[ (...).HelloFlag = true; return {Name = "Hello"} ]])

vfs:AddDirectory("Test.Embedded")
vfs:AddFile("Test.Embedded.X", [[ return {Name = "X"} ]])
vfs:AddFile("Test.Embedded.Y", [[ return {Name = "Y", Friend = (...).X} ]])

G:AddRebase("^Test%.Embedded%.", Graphene.Test.Embedded)

-- FullyLoad capability
local Test = Graphene.Test
Test:FullyLoad()

assert(Graphene.HelloFlag, "FullyLoad failed to load Test.Hello")

assert(Test, "Could not add directory 'Test'")
assert(Test.Name == "Test", "_ was not loaded for 'Test'")
assert(Test.Hello, "Hello was not loaded")
assert(Test.Hello.Name == "Hello", "Hello did not load properly.")

assert(Test.Embedded.X.Name == "X", "Rebased library did not load properly.")
assert(Test.Embedded.Y.Friend.Name == "X", "Rebased library was not rebased correctly.")

print("VFS tested successfully.")