
RegisterNetEvent('LGF_SpawnSelector:SendDiscordLog', function(playerId, playerName, coords, namePoint, screenshotUrl)
    local webhookUrl = Config.Webhook.WebhookURL
    if webhookUrl == '' then return end
    local Logo = Config.Webhook.LogoURL or nil
    local embed = {
        title = "Player Spawned",
        color = 16711680,
        description = string.format([[
            **Player Name:** %s
            **Player ID:** %s
            **Coordinates:** %s
            **Spawn Point:** %s
        ]], playerName, tostring(playerId), coords, namePoint),
        image = {
            url = screenshotUrl
        },
        timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ'),
        footer = {
            text = "Spawn Log System",
            icon_url = Logo
        },
        thumbnail = {
            url = Logo
        },
        author = {
            name = "LGF Spawn Selector Log",
            icon_url = Logo
        }
    }

    local data = {
        username = "Spawn Logger",
        embeds = { embed },
        avatar_url = Logo
    }

    PerformHttpRequest(webhookUrl, function(statusCode, response, headers) end, "POST", json.encode(data), { ["Content-Type"] = "application/json" })
end)
