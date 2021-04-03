local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
    return 1
end
function ReceiveGroupMsg(CurrentQQ, data)
    if (string.find(data.Content, "*acg") == 1) then
        luaRes =
            Api.Api_SendMsg(
            CurrentQQ,
            {
                toUser = data.FromGroupId,
                sendToType = 2,
                sendMsgType = "PicMsg",
                groupid = 0,
                content = "\n随机图片！",
                atUser = 0,
                picUrl = "http://api.mtyqx.cn/tapi/random.php"   
            }
        )
    end
    return 1
end
function ReceiveEvents(CurrentQQ, data, extData)
    return 1
end
