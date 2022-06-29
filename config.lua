Config = {}
Config.command = 'heli'
Config.cammandon = true --Should the Command be activated
Config.checkjob = true --Check if plyer has job for using command
Config.jobs = {"ambulance", "police"} --Allowed Job (For using Job lock ckeckjob == true)
Config.prop = 'proj_flare_fuse' --flare effect 
Config.time = 22000 --How long in Ms should the flares be there
Config.item = 'heliflare' --The id of the item
--If you need a need the Trigger(Its placec the flare for everyone to see on the server):
--TriggerServerEvent('maltasmoke:smoke',source, xcord,ycord,zcord, GetPlayerServerId(currentplayer))

