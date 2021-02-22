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

    mtProxyFile.__len = function(t)
        local f = assert(io.open(filename, 'r'))
        local size = f:seek("end")
        f:close()
        return size
    end

    mtProxyFile.__pairs = function()
        return function(_, k)
            if k == nil then 
                k = 0
            end
            local f = assert(io.open(filename, 'r'))
            f:seek("set", k)
            local byteAtPos = f:read(1)
            f:close()
            k = k + 1
            if byteAtPos then
                return k, byteAtPos
            end
        end
    end

    setmetatable(proxyFileTable, mtProxyFile)
    return proxyFileTable
end

local t = fileAsArray("empty")
print(#t)
for _, v in pairs(t) do
    print(v)
end