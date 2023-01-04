local QBCore = exports['qb-core']:GetCoreObject()
local lastTime = 0, 0, 0

-- Starting ATM Robbery:
RegisterNetEvent("reze:robatm")
AddEventHandler("reze:robatm", function()
	if lastTime == 0 or GetGameTimer() > lastTime then
		QBCore.Functions.TriggerCallback('rz:atmrob:server:policecount', function(status)
			if status then
				QBCore.Functions.TriggerCallback('rz:atmrob:server:GetItem', function(hasItem)
					if hasItem then 
						QBCore.Functions.Progressbar('robatm', Lang:t("label.progressbar"), Config.Progressbar, false, true, { -- Name | Label | Time | useWhileDead | canCancel
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = false,
							disableCombat = true,
						}, {
							animDict = 'anim@gangops@facility@servers@',
							anim = 'hotwire',
							flags = 49,
						}, {}, {}, function() 
							exports['ps-ui']:Scrambler(function(success)
								if success then
									print("success")
									QBCore.Functions.Notify(Lang:t("notify.success"), 'error', 7500)
									TriggerServerEvent("rz-atmrobbery:item") 
									lastTime = GetGameTimer() + Config.CoolDown		
								else
									print("fail")
									dispatch()
									TriggerServerEvent("rz-atmrobbery:removeitem") 
								end
							end, "greek", 30, 0)
						end, function() 
							QBCore.Functions.Notify(Lang:t("notify.cancel"), 'error', 7500)
						end)
					else
						QBCore.Functions.Notify(Lang:t("notify.needıtem"), 'error', 1500)
					end
				end, Config.HashItem)
			end
		end)
	else
		QBCore.Functions.Notify(Lang:t("notify.cooldown"), 'error', 7500)
	end
end)

function dispatch()
	if math.random(1,100) < Config.DispatchRate then
		exports["ps-dispatch"]:AtmRobbery()
	end
end

 exports['qb-target']:AddTargetModel(Config.AtmProps,  {
	options = {
		{
			type = "client",
			event = "reze:robatm",
			icon = "fas fa-credit-card",
			label = Lang:t("label.targetlabel"),
		},
	},
	distance = 1.5,
})
