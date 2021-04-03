local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
    return 1
end
function ReceiveGroupMsg(CurrentQQ, data)
    if (string.find(data.Content, "*tiangou") == 1) then

       --log.notice("From Lua data.FromGroupId %d", data.FromGroupId)

       response, error_message =
          http.request(
             "GET",
             "https://v1.alapi.cn/api/dog/",
             {
                query = "format=text",
                headers = {
                   Host = "alapi.cn"
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
