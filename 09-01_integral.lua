function integral(f, a, b)
    local n = 10^6
    local delta = (b - a) / n
    print(delta)
    local result = 0
    for i=0, n do
        xi = i*delta + a
        result = result + f(xi) * delta
    end
    return result
end


print(integral(function(x) return x^2 end, 0, 2))

