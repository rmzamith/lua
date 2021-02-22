local Stacks = {}

local Stack = {}

function Stack:push(val)
    Stacks[self][#Stacks[self] + 1] = val
end

function Stack:pop()
    local val = Stacks[self][#Stacks[self]]
    Stacks[self][#Stacks[self]] = nil
    return val
end

function Stack:isEmpty()
    if #Stacks[self] > 0 then return false end
    return true
end

function Stack:top()
    return Stacks[self][#Stacks[self]]
end

function Stack:new()
    local stack = {}
    local stackVals = {}
    self.__index = self
    setmetatable(stack, self)
    Stacks[stack] = stackVals
    return stack
end

s = Stack:new()
print(s:isEmpty())
s:push(1)
s:push(2)
s:push(3)
s:push(4)
print(s:isEmpty())
print(s:top())
print(s[4])
print(s:pop())
print(s:pop())
print(s:pop())
print(s:pop())
print(s:pop())
print(s:isEmpty())