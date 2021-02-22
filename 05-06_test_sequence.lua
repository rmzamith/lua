function testSequence(tab)
    maxk = 0;
    elemCount = 0
    for k, v in pairs(tab) do
        if type(k) ~= "number" then
            return false
        end
        if k > maxk then
            maxK = k
        end
        elemCount = elemCount + 1
    end
    if maxK ~= elemCount then
        return false
    end
    return true
end

print(testSequence({[1]=1, [5]=2, [3]=3, [2]=5, [6]=6, [4]=4}))