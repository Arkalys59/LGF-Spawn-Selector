local SVFNCS = {}


function SVFNCS:SendDiscordLog(playerId, playerName, coords)
    local webhookUrl = Config.Webhook.URL
    if webhookUrl == '' then return end
    local Logo = Config.Webhook.ImageURL or nil
    local embed = {
        title = "New Chat Message",
        color = 16711680,
        description = string.format([[
            **Player Name:** %s
            **Player ID:** %s
            **Chat Type:** %s
            **Description:** %s
        ]], playerName, tostring(playerId), typeChat, description),
        timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ'),
        footer = {
            text = "Chat Log System",
            icon_url = Logo
        },
        thumbnail = {
            url = Logo
        },
        author = {
            name = "Server Log",
            icon_url = Logo
        }
    }

    local data = {
        username = "Chat Logger",
        embeds = { embed },
        avatar_url = Logo
    }

    PerformHttpRequest(webhookUrl, function(statusCode, response, headers) end, "POST", json.encode(data),
        { ["Content-Type"] = "application/json" })
end

return SVFNCS
