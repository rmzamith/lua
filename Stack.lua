local Stack = {}

function Stack:push(val)
    self[#self + 1] = val
end

function Stack:pop()
    local val = self[#self]
    self[#self] = nil
    return val
end

function Stack:isEmpty()
    if #self > 0 then return false end
    return true
end

function Stack:top()
    return self[#self]
end

function Stack:new()
    local stack = {}
    self.__index = self
    setmetatable(stack, self)
    return stack
end

return Stack