--[[
	Graphene VFS-driven Loader Test

	Assumes that the VFS functions, tests the loader.
]]

print("Graphene: Starting VFS Test...")

local Graphene = require("graphene")
local G = Graphene:GetGrapheneCore()
local vfs = G.FS:GetProvider("vfs")

vfs:AddDirectory("Test")
vfs:AddFile("Test._", [[ return {Name = "Test"} ]])
vfs:AddFile("Test.Hello", [[ (...).HelloFlag = true; return {Name = "Hello"} ]])
vfs:AddFile("Test.ActuallyOther", [[ local _, meta = ...; meta.Path = "Other.Actually" return {Name = "Other.Actually"} ]])

-- Test.Embedded is a hypothetical submodule that can run on its own
-- We load it as a submodule below
vfs:AddDirectory("Test.Embedded")
vfs:AddFile("Test.Embedded.X", [[ return {Name = "X"} ]])
vfs:AddFile("Test.Embedded.Y", [[ return {Name = "Y", Friend = (...).X} ]])

-- This library is used to test against a bug that seems to crop up every once and awhile
-- It has to do with leaking directory objects
vfs:AddDirectory("Other")
vfs:AddFile("Other._", [[ return {Name = "Other"} ]])

-- Register Test.Embedded as a submodule
local Test = Graphene.Test
Test:AddGrapheneSubmodule("Embedded")

local Other = Graphene.Other

-- Test FullyLoad functionality
Test:FullyLoad()

assert(Graphene.HelloFlag, "FullyLoad failed to load Test.Hello")

assert(Test, "Could not add directory 'Test'")
assert(Test.Name == "Test", "_ was not loaded for 'Test'")
assert(Test.Hello, "Hello was not loaded")
assert(Test.Hello.Name == "Hello", "Hello did not load properly.")

assert(Test.Embedded.X.Name == "X", "Rebased library did not load properly.")
assert(Test.Embedded.Y.Friend, "Rebased library was not rebased.")
assert(Test.Embedded.Y.Friend.Name == "X", "Rebased library was not rebased correctly.")

assert(Other.Name == "Other", "Failed to load non-Test root library.")
assert(Other.Actually, "Test.ActuallyOther was not re-aliased to Other.Actually.")

print("Graphene: VFS tested passed.")