function excludeFirstParam(...)
    return select(2, ...)
end

print(excludeFirstParam(table.unpack(arg)))
