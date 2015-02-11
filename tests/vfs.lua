--[[
	Graphene VFS Test

	Makes sure the internal VFS functions correctly.
]]

print("Graphene: Starting VFS Test...")

local Graphene = require("graphene")
local G = Graphene:GetGrapheneCore()
local vfs = G.FS:GetProvider("vfs")

vfs:Clear()

vfs:AddFile("ABC", "ABC")

vfs:AddDirectory("Test")
vfs:AddFile("Test.ABC", "Test.ABC")
vfs:AddFile("Test.XYZ", "Test.XYZ")

vfs:AddFile("Hello.World", "Hello.World")

local ABC = vfs:GetFile("ABC")
local Test = vfs:GetDirectory("Test")
local Test_ABC = vfs:GetFile("Test.ABC")
local Test_XYZ = vfs:GetFile("Test.XYZ")

local Hello = vfs:GetDirectory("Hello")
local Hello_World = vfs:GetFile("Hello.World")

assert(ABC, "Could not retrieve explicitly initialized file 'ABC'.")
assert(ABC:Read() == "ABC", "File 'ABC' did not preserve contents.")

assert(Test, "Could not retrieve explicitly initialized directory 'Test'.")
assert(Test_ABC and Test_XYZ, "Could not retrieve one or more explicitly initialized files ('Test.ABC', 'Test.XYZ').")
assert(Test_ABC:Read() == "Test.ABC", "File 'Test.ABC' did not preserve contents.")
assert(Test_XYZ:Read() == "Test.XYZ", "File 'Test.XYZ' did not preserve contents.")

assert(Hello, "Could not retrieve implicitly initialized directory 'Hello'.")
assert(Hello_World, "Could not retrieve explicitly initialized file 'Hello.World'.")

vfs:Clear()

print("Graphene: VFS test passed.")