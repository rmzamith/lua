local Set = {}
local mt = {}
function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do set[v] = true end
    return set
end

function Set.union(a, b)
    local res = Set.new{}
    for k in pairs(a) do res[k] = true end
    for k in pairs(b) do res[k] = true end
    return res
end

function Set.intersection(a, b)
    local res = Set.new{}
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
end

function Set.diference(a, b)
    local res = Set.new{}
    for k in pairs(a) do
        if not b[k] then
            res[k] = a[k]
        end
    end
    return res
end 

function Set.length(set)
    local count = 0
    for _ in pairs(set) do
        count = count + 1
    end
    return count
end

function Set.tostring(set)
    local l = {}
    for e in pairs(set) do
        l[#l + 1] = tostring(e)
    end

    return "{" .. table.concat(l, ", ") .. "}"
end

mt.__add = Set.union
mt.__sub = Set.diference
mt.__mul = Set.intersection
mt.__len = Set.length
mt.__tostring = Set.tostring

return Set