local function name2node (graph, name)
    local node = graph[name]
    if not node then
        node = {name = name, adj = {}}
        graph[name] = node
    end
    return node
end

function readgraph (graphFile)
    local graph = {}
    io.input(graphFile)
    for line in io.lines() do 
        local namefrom, nameto, archlabel = string.match(line, "(%S+)%s+(%S+)%s+(%d)")
        local from = name2node(graph, namefrom)
        local to = name2node(graph, nameto)
        print("from: "..namefrom.." to: "..nameto)
        from.adj[to] = tonumber(archlabel)
    end
    io.input():close()
    return graph
end

local function prepareDijkstraUnexploredData (source, graph)
    local unexplored = {}
    for _, node in pairs(graph) do
        local weight = math.huge
        if node == source then
            goto continue
        end
        unexplored[node] = { weight = weight, from = nil }
        ::continue::
    end
    return unexplored
end

local function prepareDijkstraExploredData (source)
    local explored = {}
    explored[source] = { weight = 0, from = nil }
    return explored
end

local function printDijksta(list, label)
    io.write(label.."\n")
    for k, v in pairs(list) do
        io.write(string.format("node: %s - from: %s - weight: %s\n", k.name, (v.from or {}).name, v.weight))
    end
    io.write("\n\n")
end

local function dijkstraPathRecursion(curr, unexplored, explored)
    printDijksta(explored, "explored")
    printDijksta(unexplored, "unexplored")
    io.write("---------------------------------\n")
    for node, weight in pairs(curr.adj) do
        local currUnexploredWeight = explored[curr].weight + weight
        if unexplored[node] ~= nil and unexplored[node].weight > currUnexploredWeight then
            unexplored[node].from = curr
            unexplored[node].weight = currUnexploredWeight
        end
    end
    
    local nextNode = nil
    local minWeight = math.huge
    for unexploredNode, unexploredNodeData in pairs(unexplored) do
        if minWeight > unexploredNodeData.weight then
            nextNode = unexploredNode
            minWeight = unexploredNodeData.weight
        end
    end
    
    if nextNode == nil then return end
    explored[nextNode] = unexplored[nextNode]
    unexplored[nextNode] = nil
    dijkstraPathRecursion(nextNode, unexplored, explored)
end

local function buildDijkstraPath (explored, src, dest, path)
    local path = path or {}
    if explored[dest].from == nil then
        if dest == src then
            table.insert(path, 1, dest)
        else
            path = {}
        end
        return path 
    end
    table.insert(path, 1, dest)
    return buildDijkstraPath(explored, src, explored[dest].from, path)
end

function dijkstraPath (src, dest, graph)
    local unexplored = prepareDijkstraUnexploredData(src, graph)
    local explored = prepareDijkstraExploredData(src)
    dijkstraPathRecursion(src, unexplored, explored)
    local path = buildDijkstraPath(explored, src, dest)
    printpath(path)
end

function printpath (path)
    if path == nil or #path == 0 then
        print("no path found")
        return
    end
    print("path:")
    local prev = nil
    for i = 1, # path do
        if prev ~= nil then
            print("|"..prev.adj[path[i]])
        end
        prev = path[i]
        print(path[i].name)
    end
end

graph = readgraph("/Users/raphaelzamith/workspace/lua/graph")
a = name2node(graph, "a")
-- b = name2node(graph, "b")
-- c = name2node(graph, "c")
-- d = name2node(graph, "d")
-- e = name2node(graph, "e")
f = name2node(graph, "f")
-- g = name2node(graph, "g")
path = dijkstraPath(a, f, graph)
if path then printpath(path) end