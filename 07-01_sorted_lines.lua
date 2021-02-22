function readFile(inputFile)
    local openedFile = false
    if inputFile ~= nil then
        io.input(inputFile)
        openedFile = true
    end

    local lines = {}
    
    for line in io.lines() do
        lines[#lines+1] = line
    end

    if openedFile then
        io.input():close()
    end
    return lines
end

function sortLines(lines)
    table.sort(lines)
end

function writeOutput(sortedLines, outputFile)
    local openedFile = false
    if outputFile ~= nil then
        io.output(outputFile)
        openedFile = true
    end

    for _, line in ipairs(sortedLines) do
        io.write(line, "\n")
    end

    if openedFile then
        io.output():close()
    end
end

inputFile = arg[1]
outputFile = arg[2]

lines = readFile(inputFile)
sortLines(lines)
writeOutput(lines, outputFile)