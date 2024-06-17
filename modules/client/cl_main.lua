FUNCTIONS = {}
local CAMERA = require 'modules.client.camera'
local SetNuiFocus = SetNuiFocus
local RegisterNuiCallback = RegisterNuiCallback
local SendNUIMessage = SendNUIMessage
local tostring = tostring
local DoScreenFadeOut = DoScreenFadeOut
local DoScreenFadeIn = DoScreenFadeIn
local Wait = Wait
local SetFocusArea = SetFocusArea



-- CreateThread(function()
--     while true do
--         exports.spawnmanager:setAutoSpawn(false)
--         if NetworkIsPlayerActive(cache.playerId) then
--             ShutdownLoadingScreen()
--             ShutdownLoadingScreenNui()
--             DoScreenFadeOut(1000)
--             Wait(1000)
--             FUNCTIONS:OpenUi()
--             break
--         end
--         Wait(500)
--     end
-- end)



function FUNCTIONS:OpenUi()
    local SpawnPoints = {}
    CAMERA:EnableCamSpawn(Config.FirstCam.Position, Config.FirstCam.Height, Config.FirstCam.rot)
    Wait(2000)
    for _, zoneData in ipairs(Config.SpawnData) do
        table.insert(SpawnPoints, {
            zone = zoneData.key,
            name = zoneData.NamePoint,
            description = zoneData.Description,
            icon = zoneData.Icon,
            iconColor = zoneData.IconColor,
            image = zoneData.Image
        })
    end

    print(json.encode(SpawnPoints, { indent = true, sort_keys = true }))

    SendNUIMessage({
        action = "OpenSpawnSelector",
        titleServer = Config.TitleServer,
        iconTitleServer = Config.IconTitleServer,
        data = SpawnPoints
    })

    DoScreenFadeIn(1000)
    SetNuiFocus(true, true)
end

exports('OpenSpawnSelector', function()
    return FUNCTIONS:OpenUi()
end)

RegisterNuiCallback('pressedPoint', function(data, cb)
    local point = tostring(data.point)
    for _, spawnData in ipairs(Config.SpawnData) do
        if spawnData.key == point then
            print(json.encode(spawnData))
            local spawnPoint = spawnData.SpawnPoint
            local camData = spawnData.CamData
            CAMERA:EnableCamSpawn(spawnPoint, camData.Distance or 10.0, camData.Height or 10.0,
                camData.rot or vector3(0, 0, 0))
            break
        end
    end
    cb({})
end)



RegisterNuiCallback('ClickedPoint', function(data, cb)
    local Ped = cache.ped or PlayerPedId()
    local point = tostring(data.point)
    for _, spawnData in ipairs(Config.SpawnData) do
        if (spawnData.key == point) then
            cb({})
            local spawnPoint = spawnData.SpawnPoint
            local playerId = cache.serverId
            local playerName = GetPlayerName(PlayerId())
            local coords = string.format("X: %.2f, Y: %.2f, Z: %.2f", spawnPoint.x, spawnPoint.y, spawnPoint.z)
            local namePoint = spawnData.NamePoint


            DoScreenFadeOut(1000)
            Wait(1000)
            CAMERA:CloseCam()
            SetEntityCoordsNoOffset(Ped, spawnPoint.x, spawnPoint.y, spawnPoint.z, false, false, false)
            SetEntityHeading(Ped, spawnPoint.w)
            SetFocusArea(spawnPoint.x, spawnPoint.y, spawnPoint.z, spawnPoint.w)
            SetNuiFocus(false, false)
            Wait(3000)
            DoScreenFadeIn(1000)
            Wait(2500)
            if Config.Webhook.EnableLog then
                exports['screenshot-basic']:requestScreenshotUpload(Config.Webhook.SinglePhoto, 'file', {
                    encoding = 'jpg',
                    quality = 0.92
                }, function(data)
                    local resp = json.decode(data)
                    local screenshotUrl = resp.attachments[1].url
                    TriggerServerEvent('LGF_SpawnSelector:SendDiscordLog', playerId, playerName, coords, namePoint,
                        screenshotUrl)
                end)
            end
            return
        end
    end
end)

RegisterNUICallback('getLocale', function(data, cb)
    cb(Config.Locale)
end)


function FUNCTIONS:GetLastCoords()
    local lastCoords = lib.callback.await('LGF_SpawnSelector:GetLastCoords', false, cache.serverId)
    return lastCoords
end

RegisterNuiCallback('lastCoords', function(data, cb)
    cb({})
    local Ped = cache.ped or PlayerPedId()
    local lastCoords = FUNCTIONS:GetLastCoords()
    print(json.encode(lastCoords))
    DoScreenFadeOut(1000)
    Wait(1000)
    SetNuiFocus(false, false)
    CAMERA:CloseCam()
    SetEntityCoordsNoOffset(Ped, lastCoords.x, lastCoords.y, lastCoords.z, false, false, false)
    SetEntityHeading(Ped, lastCoords.w)
    SetFocusArea(lastCoords.x, lastCoords.y, lastCoords.z)
    Wait(3000)
    DoScreenFadeIn(1000)
end)


-- Example Command for open Ui

-- RegisterCommand('ui', function()
--     DoScreenFadeOut(1000)
--     FUNCTIONS:OpenUi()
--     Wait(1500)
--     DoScreenFadeIn(1000)
-- end)

RegisterNetEvent('LGF_SpawnSelector:OpenSpawnSelector', function()
    FUNCTIONS:OpenUi()
end)
