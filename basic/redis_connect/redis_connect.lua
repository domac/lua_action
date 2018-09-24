local key = "dayname"

local redis = require("resty.redis")
local red = redis:new()

local function close_redis(red)
    -- body
    if not red then
        return
    end

    local ok, err = red:close()
    if not ok then
        ngx.say("close redis error: ", err)
    end
end

red:set_timeout(1000)

local ip = "172.17.0.1"
local port = 6379
local ok, err = red:connect(ip, port)

if not ok then
    ngx.say("connect to redis error", err)
    return close_redis(red)
end

ok, err = red:set(key,"zhongqiujie")
if not ok then 
    ngx.say("set data error : ", err)
    return close_redis(red)
end

local resp, err = red:get(key)
if not resp then
    ngx.say("get data error", err)
    return close_redis(red)
end

if resp == ngx.null then
    resp = ''
end

ngx.say("data =", resp)

close_redis(red)