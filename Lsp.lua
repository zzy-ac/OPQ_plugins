
local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
    return 1
end
function ReceiveGroupMsg(CurrentQQ, data)
    if (string.find(data.Content, "*lsp") == 1) then
        luaRes =
            Api.Api_SendMsg(
            CurrentQQ,
            {
                toUser = data.FromGroupId,
                sendToType = 2,
                sendMsgType = "TextMsg",
                groupid = 0,
                content = "你在想屁吃！还想lsp？？没门！",
                atUser = 0   
            }
        )
    end
    return 1
end
function ReceiveEvents(CurrentQQ, data, extData)
    return 1
end
