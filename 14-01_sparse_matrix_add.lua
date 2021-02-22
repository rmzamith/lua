function addSpareMatrix(matrixA, matrixB)
    local c = {}
    for ka, ca in pairs(matrixA) do
        c[ka] = {}
        for ia, va in pairs(ca) do
            c[ka][ia] = (c[ka][ia] or 0) + va
        end
    end
    for kb, cb in pairs(matrixB) do
        for ib, vb in pairs(cb) do
            c[kb][ib] = (c[kb][ib] or 0) + vb
        end
    end
    return c
end

function printMatrix(matrix, ROW, COL)
    for i = 1, ROW do
        for j = 1, COL do
            io.write((matrix[j][i] or 0).." ")
        end
        io.write("\n")
    end
    io.write("\n")
end

matrixA = {{1,1},{2,2},{nil,nil,3,3},{nil,nil,3,3}}
matrixB = {{2,2},{1,1},{nil,nil,3,3},{nil,nil,3,6}}
printMatrix(matrixA, 4, 4)
printMatrix(matrixB, 4, 4)
printMatrix(addSpareMatrix(matrixA, matrixB), 4, 4)