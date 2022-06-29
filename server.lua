RegisterServerEvent('maltasmoke:smoke')
AddEventHandler('maltasmoke:smoke', function(source, posx, posy, posz, ped)
   local _source = ped
   local bposx = posx
   local bposy = posy
   local bposz = posz
 TriggerClientEvent('maltasmoke:allsmoke',_source, bposx, bposy, bposz, 'a')
end)
