function listNew ()
    return {first = 0, last = 0}
end

function pushFirst (list, value)
    local first = list.first - 1
    if(list.first == 0 and list.last == 0 and list[0] == nil) then
        first = 0
    end
    list.first = first
    list[first] = value
    io.write(string.format("pushFirst: %s - first: %s - last: %s\n", value, list.first, list.last))
end

function pushLast (list, value)
    local last = list.last + 1
    if(list.first == 0 and list.last == 0 and list[0] ~= nil) then
        last = 0
    end
    list.last = last
    list[last] = value
    io.write(string.format("pushLast: %s - first: %s - last: %s\n", value, list.first, list.last))
end

function popFirst (list)
    local first = list.first
    if first == 0 and list.last == 0 and list[0] == nil then error("list is empty") end
    local value = list[first]
    list[first] = nil
    if first + 1 > list.last then
        list.first = 0
        list.last = 0
    else
        list.first = first + 1
    end
    io.write(string.format("popfirst: %s - first: %s - last: %s\n", value, list.first, list.last))
    return value
end

function popLast (list)
    local last = list.last
    if list.first == 0 and last == 0 and list[0] == nil then error("list is empty") end
    local value = list[last]
    list[last] = nil
    if list.first > last - 1 then
        list.first = 0
        list.last = 0
    else
        list.last = last - 1
    end
    io.write(string.format("popLast: %s - first: %s - last: %s\n", value, list.first, list.last))
    return value
end

function printList (list)
    if list.first == 0 and list.last == 0 then
        io.write("deque empty")
    else
        for i = list.first, list.last do
            io.write(list[i].." ")
        end
    end
    io.write("\n")
end

list = listNew()
pushFirst(list, 3)
pushFirst(list, 2)
popLast(list)
pushFirst(list, 2)
popLast(list)
pushFirst(list, 2)
popLast(list)
pushFirst(list, 2)
popLast(list)
pushFirst(list, 2)
popLast(list)
pushFirst(list, 2)
popLast(list)
pushFirst(list, 2)
popLast(list)
pushFirst(list, 2)
popLast(list)
pushFirst(list, 2)
popLast(list)
pushFirst(list, 2)
popLast(list)
pushFirst(list, 2)
popLast(list)
popFirst(list)
printList(list)

