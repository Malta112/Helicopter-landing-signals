local ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1)
    end
end)



RegisterNetEvent('maltasmoke:allsmoke') --TO show every client the 'smaoke'
AddEventHandler('maltasmoke:allsmoke', function(posx, posy, posz, bool)
	if bool == 'a' then

		if not HasNamedPtfxAssetLoaded("core") then
			RequestNamedPtfxAsset("core")
			while not HasNamedPtfxAssetLoaded("core") do
				Citizen.Wait(1)
			end
		end
		SetPtfxAssetNextCall("core")
		--local smoke = StartParticleFxLoopedAtCoord("proj_flare_trail", posx, posy, posz, 0.0, 0.0, 0.0, 2.0, false, false, false, false)
		local smoke = StartParticleFxLoopedAtCoord(Config.prop, posx, posy, posz, 0.0, 0.0, 0.0, 2.0, false, false, false, false)
        		SetParticleFxLoopedAlpha(smoke, 0.8)
		SetParticleFxLoopedColour(smoke, 0.0, 0.0, 0.0, 0)
		Citizen.Wait(Config.time)
		StopParticleFxLooped(smoke, 0)
	else
		StopParticleFxLooped(smoke, 0)
	end


end)
RegisterNetEvent('maltasmoke:itemsmoke')
AddEventHandler('maltasmoke:itemsmoke', function(source)
	smoke()
end)
RegisterCommand('heli', function()
	if Config.commandon then
		smoke()
	else 
		ShowNotification('The Command is disabled!!!')
	end
end)

 function smoke () 
	if Config.checkjob then
		for k, v in pairs(Config.jobs) do
			if ESX.GetPlayerData().job.name == v then
				local retval --[[ vector3 ]] =
				GetEntityCoords(PlayerPedId(), true)
				local source = PlayerPedId()
				local xcord=retval.x + 3.0
				local ycord=retval.y + 3.0
				local zcord=retval.z -1
				local target = GetActivePlayers()
				local players = GetActivePlayers()
				for i = 1, #players do
					local currentplayer = players[i]
					local ped = GetPlayerPed(currentplayer)
					TriggerServerEvent('maltasmoke:smoke',source, xcord,ycord,zcord, GetPlayerServerId(currentplayer))
						local xcord=retval.x - 3.0
						local ycord=retval.y - 3.0
					TriggerServerEvent('maltasmoke:smoke',source, xcord,ycord,zcord, GetPlayerServerId(currentplayer))
						local xcord=retval.x + 3.0
						local ycord=retval.y - 3.0		
					TriggerServerEvent('maltasmoke:smoke',source, xcord,ycord,zcord, GetPlayerServerId(currentplayer))
						local xcord=retval.x - 3.0
						local ycord=retval.y + 3.0
					TriggerServerEvent('maltasmoke:smoke',source, xcord,ycord,zcord, GetPlayerServerId(currentplayer))
				end
			end
		end
	else --If Job lock isn't in use
		local retval --[[ vector3 ]] =
		GetEntityCoords(PlayerPedId(), true)
		local source = PlayerPedId()
		local xcord=retval.x + 3.0
		local ycord=retval.y + 3.0
		local zcord=retval.z -1
		local target = GetActivePlayers()
		local players = GetActivePlayers()
		for i = 1, #players do
			local currentplayer = players[i]
			local ped = GetPlayerPed(currentplayer)
			TriggerServerEvent('maltasmoke:smoke',source, xcord,ycord,zcord, GetPlayerServerId(currentplayer))
				local xcord=retval.x - 3.0
				local ycord=retval.y - 3.0
			TriggerServerEvent('maltasmoke:smoke',source, xcord,ycord,zcord, GetPlayerServerId(currentplayer))
				local xcord=retval.x + 3.0
				local ycord=retval.y - 3.0		
			TriggerServerEvent('maltasmoke:smoke',source, xcord,ycord,zcord, GetPlayerServerId(currentplayer))
				local xcord=retval.x - 3.0
				local ycord=retval.y + 3.0
			TriggerServerEvent('maltasmoke:smoke',source, xcord,ycord,zcord, GetPlayerServerId(currentplayer))
		end
	end
	
    
end



	