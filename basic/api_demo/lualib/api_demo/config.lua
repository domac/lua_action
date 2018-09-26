--[[
api config file
]]

_Config = {

    TOPIC = "es-demo",

    -- broker config
    BROKER_LIST = {
        { host = "172.17.0.3", port = 9092 }
    },

    --[[
        kafka config :
            one ngx worker one kafka client or producer instance
    ]]
    KAFKA_CONFIG= {
        producer_type = "async",            --- async way
        socket_timeout = 6000,              --- request_timeout ms
        max_retry = 2,                      --- retry times
        refresh_interval = 600 * 1000,      --- auto refresh the metadata in milliseconds.
        keepalive_timeout = 600 * 1000,     --- connection timeout 10 min
        keepalive_size = 40,                --- pool size for each nginx worker
        max_buffering = 1000000,            --- queue size
        flush_time = 100,                   --- send kafka XX ms
        batch_num = 5                       --- bulk size to send kafka
    }
}

return _Config