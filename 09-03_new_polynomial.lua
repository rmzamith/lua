function newPoly(a)
    local coefficients = a
    return function(x)
        result = 0
        for i, t in ipairs(coefficients) do
            result = result + (t * (x ^ (i - 1)))
        end
        return result
    end
end

f = newPoly({3,0,1})
print(f(0))
print(f(5))
print(f(10))