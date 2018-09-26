local _config = require "api_demo.config"
local _producer = require "resty.kafka.producer" 

local data = ngx.ctx.messageList 

local logger = ngx.log
local ERR = ngx.ERR

local BROKER_LIST = _config.BROKER_LIST
local KAFKA_CONFIG = _config.KAFKA_CONFIG
local topic = _config.TOPIC


local kafka_producer = _producer:new(BROKER_LIST, KAFKA_CONFIG)
local ok, err = kafka_producer:send(topic, key, data)
if  not ok  then
    logger(ERR,"kafka send error: "..err)
end