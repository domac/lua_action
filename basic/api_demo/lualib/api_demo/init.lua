-- user : domac.li

local ERR = ngx.ERR
local logger = ngx.log

print("ready to init api_demo")

-- load config
_config = require "api_demo.config"

if not _config then
    logger(ERR, "load config error")
end