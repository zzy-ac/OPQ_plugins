local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
    return 1
end
function ReceiveGroupMsg(CurrentQQ, data)
    if (string.find(data.Content, "*xs") == 1) then
        response, error_message =
            http.request(
            "GET",
            "http://api-x.aya1.xyz:6/",
            {
                query = "format=text",
                headers = {
                    Host = "tenapi.cn"
                }
            }
        )

        luaRes =
            Api.Api_SendMsg(
            CurrentQQ,
            {
                toUser = data.FromGroupId,
                sendToType = 2,
                sendMsgType = "TextMsg",
                groupid = 0,
                content = response.body,
                atUser = 0
            }
        )
    end
    return 1
end
function ReceiveEvents(CurrentQQ, data, extData)
    return 1
end
