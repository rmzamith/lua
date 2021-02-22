function split(string, splitStr)
    local matcher = string.format("[^%s]*",splitStr)
    local list = {}
    for elem in string.gmatch(string, matcher) do
        table.insert(list,elem)
    end
    return list
end

for i, str in ipairs(split("", " ")) do
    print(string.format("inx: %d, str: %s", i, str))
end