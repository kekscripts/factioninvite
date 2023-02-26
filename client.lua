ESX = exports['es_extended']:getSharedObject()

local invitedfraction = nil

function toggleui()
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "showinvite",
        factionname = invitedfraction
    })
end

RegisterNUICallback("accept", function(data, cb)
    local fraction = invitedfraction
    TriggerServerEvent("kekscripts:acceptinvite", fraction)
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "hideinvite"
    })
    invitedfraction = nil
end)

RegisterNUICallback("decline", function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "hideinvite"
    })
    invitedfraction = nil
end)

function factioninvitenearest()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer == -1 or closestDistance > 3.0 then
        ESX.ShowNotification("No player in range")
    else
        TriggerServerEvent("kekscripts:inviteplayer", GetPlayerServerId(closestPlayer))
    end
end

RegisterCommand("factioninvite", function()
    factioninvitenearest()
end)

RegisterNetEvent("kekscripts:invite")
AddEventHandler("kekscripts:invite", function(fraction)
    invitedfraction = fraction
    toggleui()
end)
