local CAM = {}
local currentCamera

function CAM:EnableCamSpawn(coords, distance, height, rotation)
    local camCoords = coords

    local newCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(newCam, camCoords.x, camCoords.y, camCoords.z + height)
    SetCamFov(newCam, 38.0)
    SetCamUseShallowDofMode(newCam, true)
    SetCamNearDof(newCam, 1.2)
    SetCamFarDof(newCam, 12.0)
    SetCamDofStrength(newCam, 1.0)
    SetCamDofMaxNearInFocusDistance(newCam, 1.0)
    SetFocusArea(camCoords.x, camCoords.y, camCoords.z + height, 0.0, 0.0, 0.0)

    if rotation then
        SetCamRot(newCam, -rotation.x, rotation.y, rotation.z)
    else
        SetCamRot(newCam, 0.0, 0.0, 0.0)
    end

    if currentCamera ~= nil then
        local transitionDuration = 2700
        SetCamActiveWithInterp(newCam, currentCamera, transitionDuration, true, true)
        Citizen.Wait(transitionDuration)
        DestroyCam(currentCamera, false)
        SetFocusArea(camCoords.x, camCoords.y, camCoords.z + height, 0.0, 0.0, 0.0)
    else
        SetCamActive(newCam, true)
    end

    currentCamera = newCam
    RenderScriptCams(true, true, 2700, 1, 0)
end

function CAM:CloseCam()
    RenderScriptCams(false, true, 1250, 1, 0)
    DestroyCam(currentCamera, false)
    ClearPedTasks(cache.ped)
end

AddEventHandler("onResourceStop", function(resource)
    if cache.resource == resource and DoesCamExist(currentCamera) then
        CAM:CloseCam()
    end
end)

return CAM
