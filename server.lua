ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent("kekscripts:acceptinvite")
AddEventHandler("kekscripts:acceptinvite", function(fraction)
  local xPlayer = ESX.GetPlayerFromId(source)
  local fraction = fraction
  xPlayer.setJob(fraction, 1)
  TriggerClientEvent("esx:showNotification", source, "You have been invited to the ~b~" .. fraction .. " ~w~fraction!")
end)

RegisterNetEvent("kekscripts:inviteplayer")
AddEventHandler("kekscripts:inviteplayer", function(player)
  local xPlayer = ESX.GetPlayerFromId(source)
  local xTarget = ESX.GetPlayerFromId(player)
  local job = xPlayer.getJob().name
  local jobgrade = xPlayer.getJob().grade
  if not Config.Jobs[job] then
    TriggerClientEvent("esx:showNotification", source, "You are not in a job that can invite players!")
  else
    local bossrank = Config.Jobs[job].bossrank
  if jobgrade >= bossrank then
    TriggerClientEvent("kekscripts:invite", xTarget.source, job)
  else
    TriggerClientEvent("esx:showNotification", source, "You are not high enough rank to invite players!")
  end
end
end)

