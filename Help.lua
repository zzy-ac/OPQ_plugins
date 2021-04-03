
local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
    return 1
end
function ReceiveGroupMsg(CurrentQQ, data)
    if (string.find(data.Content, "*help") == 1) then
        luaRes =
            Api.Api_SendMsg(
            CurrentQQ,
            {
                toUser = data.FromGroupId,
                sendToType = 2,
                sendMsgType = "TextMsg",
                groupid = 0,
                content = "菜单\n*help 查看帮助\n*acg 获得一张随机萌图\n*cal 本月日历\n*lsp [数据删除]\n*每日一言 获取一句抚慰心灵的话语\n*复读机 {内容}\n*答案之书 {内容}\n*{xx}还是{xx} \n*music{歌名}  可以在线点歌 \n*tiangou 获取一句舔狗语录 \n*晚安 获得一句晚安",
                atUser = 0   
            }
        )
    end
    return 1
end
function ReceiveEvents(CurrentQQ, data, extData)
    return 1
end
