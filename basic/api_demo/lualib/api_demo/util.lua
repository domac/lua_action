local _Util = {}

function _Util.get_post_data()
    -- body
    local args = {}
    local request_method = ngx.var.request_method

    -- get post data
    if "POST" == request_method then
        ngx.req.read_body()
        args = ngx.req.get_body_data()
    end

    return args
end

return _Util