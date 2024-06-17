if not lib then error("LGF Report requires ox_lib. Refer to the documentation.") end

local Framework = {}

local Core = nil
local GetCore = promise.new()
local Path = lib.context
local CitWait = Citizen.Await

if GetResourceState("LegacyFramework") ~= "missing" then
    Core = "LegacyFramework"
    LGF = exports.LegacyFramework:ReturnFramework()
    GetCore:resolve({ "LegacyFramework", "ReturnFramework" })
elseif GetResourceState("es_extended") ~= "missing" then
    Core = "es_extended"
    ESX = exports.es_extended:getSharedObject()
    GetCore:resolve({ "es_extended", "getSharedObject" })
elseif GetResourceState("qb-core") ~= "missing" then
    Core = "qbx_core"
    GetCore:resolve({ "qb-core", "GetCoreObject" })
else
    GetCore:reject("Could not find a framework!")
    return
end


Object = table.unpack(CitWait(GetCore))


if Path == 'server' then
    function Framework:GetPlayerIdentifier(id)
        if Core == 'LegacyFramework' then
            return LGF.SvPlayerFunctions.GetPlayerData(id)[1].charName
        end
        if Core == 'es_extended' then
            return ESX.GetIdentifier(id)
        end
        if Core == 'qbx_core' then
            return exports.qbx_core:GetPlayer(id).PlayerData.license
        end
    end

    lib.callback.register('LGF_SpawnSelector:GetLastCoords', function(source)
        local playerIdentifier = Framework:GetPlayerIdentifier(source)
        if Core == "LegacyFramework" then
            local lastCoords = MySQL.scalar.await("SELECT `lastCoords` FROM `users` WHERE `charName` = ?",
                { playerIdentifier })

            if lastCoords then
                lastCoords = json.decode(lastCoords)
            end

            return lastCoords
        elseif Core == "es_extended" then
            local lastCoords = MySQL.scalar.await("SELECT `position` FROM `users` WHERE `identifier` = ?",
                { playerIdentifier })

            if lastCoords then
                lastCoords = json.decode(lastCoords)
            end

            return lastCoords
        elseif Core == "qbx_core" then

        end
    end)
end


return Framework
