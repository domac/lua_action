local producer = require("resty.kafka.producer")

local brokers = {
    { host = "172.17.0.3", port = 9092 },
}

local topic = "es-demo"
local key = "key"
local message = "hello-kafka"

local p = producer:new(brokers)
local offset, err = p:send(topic, key, message)

if not offset then
    ngx.say("send err:", err)
    return
end

ngx.say("send success, offset:", tonumber(offset))


local bp = producer:new(brokers, { producer_type = "async" })

local ok, err = bp:send(topic, "bkey", message)
if not ok then
    ngx.say("send err:", err)
    return
end

ngx.say("async send success, offset:", tonumber(offset))