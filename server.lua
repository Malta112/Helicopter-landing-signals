ESX = NetworkIsLocalPlayerInvincible
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('maltasmoke:smoke')
AddEventHandler('maltasmoke:smoke', function(source, posx, posy, posz, ped)
   local _source = ped
   local bposx = posx
   local bposy = posy
   local bposz = posz
 TriggerClientEvent('maltasmoke:allsmoke',_source, bposx, bposy, bposz, 'a')
end)

ESX.RegisterUsableItem(Config.item, function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.removeInventoryItem(Config.item, 1) --This removes the item from the players inventory
  TriggerClientEvent('maltasmoke:itemsmoke', source)
  end)
