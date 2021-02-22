function excludeLastParam(...)
    argsTable = {...}
    table.remove(argsTable)
    return table.unpack(argsTable)
end

print(excludeLastParam(table.unpack(arg)))