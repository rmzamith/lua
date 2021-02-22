function polynomial(a, x)
    result = 0
    for i, t in ipairs(a) do
        result = result + (t * (x ^ (i - 1)))
    end
    return result
end

a={}
for elem in string.gmatch(arg[1], "[^,]+") do
    table.insert(a,elem)
end

print(polynomial(a, arg[2]))