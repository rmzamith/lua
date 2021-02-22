local Stack = require("Stack")

local StackQueue = Stack:new()

function StackQueue:insertBottom(val)
    table.insert(self, 1, val)
end


local s = StackQueue:new()
print(s:isEmpty())
s:push(1)
s:push(2)
s:push(3)
s:push(4)
print(s:isEmpty())
s:insertBottom(10)
print(s:top())
print(s:pop())
print(s:pop())
print(s:pop())
print(s:pop())
print(s:pop())
print(s:pop())
print(s:isEmpty())