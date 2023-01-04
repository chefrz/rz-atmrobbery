local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("rz-atmrobbery:item") 
AddEventHandler("rz-atmrobbery:item", function()
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
	if Config.LaptopSuccessRate then
		if math.random(0,100) < Config.LaptopExplosionRate then
			TriggerClientEvent("QBCore:Notify", Lang:t("notify.laptopexplosion"), "error")
			xPlayer.Functions.RemoveItem(Config.HashItem, 1)
		end
	end
    if Config.GiveItem then
        if math.random(0,100) < Config.LuckyItemRate then
            TriggerClientEvent("QBCore:Notify", Lang:t("notify.luckyıtem"), "error")
            xPlayer.Functions.AddItem(Config.Item, 1)
        end
    end
	local money = math.random(Config.MinCash, Config.MaxCash)
	xPlayer.Functions.AddMoney('cash', money)
	TriggerClientEvent("QBCore:Notify",  Lang:t("notify.money") .. money .. "$")
end)

RegisterServerEvent("rz-atmrobbery:removeitem") 
AddEventHandler("rz-atmrobbery:removeitem", function()
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
	xPlayer.Functions.RemoveItem(Config.HashItem, 1)
end)

QBCore.Functions.CreateCallback('rz:atmrob:server:GetItem', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then
        local RadioItem = Player.Functions.GetItemByName(item)
        if RadioItem ~= nil and not Player.PlayerData.metadata["isdead"] and
            not Player.PlayerData.metadata["inlaststand"] then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('rz:atmrob:server:policecount', function(source, cb)
    local src = source
    local players = QBCore.Functions.GetPlayers(src)
    local policeCount = 0

    for i = 1, #players do
        local player = QBCore.Functions.GetPlayer(players[i])
        if (player.PlayerData.job.name == 'police' and player.PlayerData.job.onduty) then
            policeCount = policeCount + 1
        end
    end

    if policeCount >= Config.Police then
        cb(true)
    else
        cb(false)
        TriggerClientEvent('QBCore:Notify', src, Lang:t("notify.needpolice"), "error")
    end
end)


