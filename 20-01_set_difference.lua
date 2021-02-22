local SetLib = require("Set")
local set1 = SetLib.new{1,2,3,4,5}
local set2 = SetLib.new{4,7,8}
print(tostring(set1 + set2))
print(tostring(set1 * set2))
print(tostring(set1 - set2))