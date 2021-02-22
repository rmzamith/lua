function readLastLine(filename, linesToRead)
    local f = assert(io.open(filename,"r"))
    local totalSize = f:seek("end")
    local lineCount = 1
    for i = 1, totalSize do
        f:seek("end", -i)
        local l = f:read()
        if l == nil then
            break
        end
        local currChar = string.sub(l, 1, 1)
        if string.byte(currChar) == nil then
            local j = i - 1;
            f:seek("end", -j)
            local line = f:read()
            print(line)
            f:seek("end", -i)
            if lineCount < linesToRead then
                lineCount = lineCount + 1
            else
                break
            end
        end
        -- print("inx: "..-i)
        -- print("buffer: "..l)
        -- local currChar = string.sub(l, 1, 1)
        -- print(string.format("Code: %d - Curr char: %s", string.byte(currChar) or -1, currChar))
    end
    if lineCount == 1 and linesToRead > 0 then
        f:seek("set")
        print(f:read("a"))
    end
end

readLastLine(arg[1], tonumber(arg[2]))
