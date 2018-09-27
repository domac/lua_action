local ffi = require("ffi")

ffi.cdef[[
    int printf(const char *fmt, ...);
    int strcasecmp(const char *s1, const char *s2);
]]

ffi.C.printf("Hello %s!\n", "world")
ret = ffi.C.strcasecmp("domac", "Domac")
ffi.C.printf(ret.."\n")
ret = ffi.C.strcasecmp("domac", "mac")
ffi.C.printf(ret.."\n")