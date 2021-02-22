function fileAsArray(filename)
    proxyFileTable = {}
    mtProxyFile = {}

    mtProxyFile.__index = function(_, key)
        local f = assert(io.open(filename, 'r'))
        f:seek("set", key-1)
        local byteAtPos = f:read(1)
        f:close()
        return byteAtPos
    end

    mtProxyFile.__newindex = function(_, key, val)
        local f = assert(io.open(filename, 'r+'))
        f:seek("set", key-1)
        f:write(val)
        f:close()
    end

    setmetatable(proxyFileTable, mtProxyFile)
    return proxyFileTable
end

local t = fileAsArray("empty")
print(t[1])
print(t[2])
print(t[3])
t[2] = 'e'
print(t[1])
print(t[2])
print(t[3])
print(t[4])