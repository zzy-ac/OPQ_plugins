local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
   return 1
end
function ReceiveGroupMsg(CurrentQQ, data)
   if (string.find(data.Content, "*cal") == 1) then

      --log.notice("From Lua data.FromGroupId %d", data.FromGroupId)
      local out = io.popen( "cal" )
      
      luaRes =
         Api.Api_SendMsg(
            CurrentQQ,
            {
               toUser = data.FromGroupId,
               sendToType = 2,
               sendMsgType = "TextMsg",
               groupid = 0,
               content = out:read("*all"),
               atUser = 0
            }
         )
      log.notice("From Lua SendMsg Ret-->%d", luaRes.Ret)
   end
   return 1
end
function ReceiveEvents(CurrentQQ, data, extData)
    return 1
end
