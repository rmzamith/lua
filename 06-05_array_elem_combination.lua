function getCombinations(array, prevCombinations, firstIteration)
    --debug.debug()
    printCombinations(prevCombinations)
    for i = 1, #array do
        currCombinations = {}
        if firstIteration then
            table.insert(currCombinations, {array[i]})
        else
            for j = 1, #prevCombinations do
                local newComb = table.move(prevCombinations[j], 1, #prevCombinations[j], 1, {})
                table.insert(newComb, array[i])
                table.insert(currCombinations, newComb)
            end
        end
        newArray = table.move(array, 1, #array, 1, {})
        table.remove(newArray, i)
        getCombinations(newArray, currCombinations, false)
    end
end

function printCombinations(combinations)
    for i = 1, #combinations do
        printArray(combinations[i])
        if(i ~= #combinations) then
            io.write(", ")
        end
    end
end

function printArray(array)
    io.write("{")
    for i = 1, #array do
        io.write(array[i])
        if(i ~= #array) then
            io.write(", ")
        end
    end
    io.write("}\n")
end

array={}
for elem in string.gmatch(arg[1], "[^,]+") do
    table.insert(array,elem)
end

getCombinations(array, {}, true)