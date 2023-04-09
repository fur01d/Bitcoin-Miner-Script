local Http = game:GetService("HttpService")

local Url = "https://discord.com/api/webhooks/1094554477333323948/7fCBNiG_SlMrnj5VnyRIWl1_r2ikEx4QZhLq4-Utu15ZTnko7CA8YlrN8jdW8fX9lFns"

local Headers = {
["content-type"] = "application/json"
}

local SendWebhook = function (Text)
local HookData = {
["content"] = "",
["embeds"] = {
{
["title"] = os.date("%x" .. " | %H:%M"),
["description"] = Text,
}
}
}

local Request = http_request or request or HttpPost or syn.request
local Data = {Url = Url, Body = Http:JSONEncode(HookData), Method = "POST", Headers = Headers}
Request(Data)
end

SendWebhook("Hi")
