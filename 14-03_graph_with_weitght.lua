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
        from.adj[to] = archlabel
    end
    io.input():close()
    return graph
end

function findpath(curr, to, path, visited)
    path = path or {}
    visited = visited or {}
    if visited[curr] then 
        return nil
    end
    visited[curr] = true
    path[#path + 1] = curr
    if curr == to then
        return path
    end
    for node in pairs(curr.adj) do
        local p = findpath(node, to, path, visited)
        if p then return p end
    end
    table.remove(path)
end

function printpath (path)
    local prev = nil
    for i = 1, # path do
        if prev ~= nil then
            print("|"..prev.adj[path[i]])
        end
        prev = path[i]
        print(path[i].name)
    end
end

g = readgraph("graph")
a = name2node(g, "a")
b = name2node(g, "b")
c = name2node(g, "c")
d = name2node(g, "d")
e = name2node(g, "e")
p = findpath(a, d)
if p then printpath(p) end