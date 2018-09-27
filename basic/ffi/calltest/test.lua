local ffi = require('ffi')

test = ffi.load("./test.so", true)

ffi.cdef[[
int add(int x, int y);
]]

ret = test.add(1, 20)
print(ret)


ret = ffi.C.add(1, 10)
print(ret)