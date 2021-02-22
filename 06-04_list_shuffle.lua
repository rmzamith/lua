function shuffleList(list)
    math.randomseed(os.time())
    shuffledList = {}
    listSize = #list
    for i = 1, listSize do
        ::SHUF_INX::
        currInx = math.random(1, listSize)
        if shuffledList[currInx] ~= nil then
            goto SHUF_INX
        end 
        shuffledList[currInx] = list[i]
    end
    return shuffledList
end

list={}
for elem in string.gmatch(arg[1], "[^,]+") do
    table.insert(list,elem)
end

for i = 1, #list do
    io.write(list[i])
    if(i ~= #list) then
        io.write(", ")
    end
end

shuffledList = shuffleList(list)

io.write("\n")
for i = 1, #shuffledList do
    io.write(shuffledList[i])
    if(i ~= #shuffledList) then
        io.write(", ")
    end
end
io.write("\n")