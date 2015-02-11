--[[
	Graphene: Run all tests

	Runs all tests in order.
	Overrides print to make it prettier for the tests.
]]

local real_print = print

print = function(...)
	local args = {}

	for i = 1, select("#", ...) do
		table.insert(args, "\t" .. tostring(select(i, ...)):gsub("\r?\n", "\n\t"))
	end

	return real_print(unpack(args))
end

real_print("Graphene: Running all tests...")

require("tests.vfs")
require("tests.loader")

real_print("Graphene: All tests passed.")

print = real_print