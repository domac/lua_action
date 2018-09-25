local set1 = {10,20,30}
local set2 = {40,50,60}

-- 交集处理
union = function (self, otherset)
    -- body
    local set = {}
    local result = {}

    for i, j in pairs(self) do set[j] = true end
    for i, j in pairs(otherset) do set[j] = true end
    for i, j in pairs(set) do table.insert(result, i) end
    return result
end

setmetatable(set1, {__add = union})

set3 = set1 + set2

for _, j in pairs(set3) do
    io.write(j.." ")
end