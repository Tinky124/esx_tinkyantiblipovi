ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--[[CreateThread(function()
    while true do
        Wait(5000)
        local igraci = GetNumPlayerIndices()
        TriggerClientEvent('esx_tinkyantiblipovi:igraci', -1, igraci)
    end
end)]]

local porukazacheatera = "Dobar pokusaj da cheatujes blipove na mapi :)"

local dozvoljenegrupe = {
    'police',
    'offpolice',
    'admin',
    'superadmin'
}

RegisterNetEvent("esx_tinkyantiblipovi:ugasiigraca")
AddEventHandler("esx_tinkyantiblipovi:ugasiigraca", function()
    local jelidozvoljeno = false
    local samotest = source
    if samotest ~= nil then -- provjeri da nije NIL :)
        local ime = GetPlayerName(samotest)
        if ime ~= nil then -- provjeri da nije NIL :)
            local igraccxplayer = ESX.GetPlayerFromId(samotest)
            if igraccxplayer ~= nil then -- provjeri da nije NIL :)
                local grupa = igraccxplayer.getGroup()
                local posao, posaoime = igraccxplayer.job, igraccxplayer.job.name
                if posao ~= nil and posaoime ~= nil and grupa ~= nil then -- provjeri da nije NIL :)
                    for k, v in pairs(dozvoljenegrupe) do
                        if posaoime == v or grupa == v then
                            jelidozvoljeno = true
                            break
                        end
                    end
                    if not jelidozvoljeno then
                        print('^1'..ime..'^0 (^1'..tonumber(samotest)..'^0) je pokusao da ukljuci blipove za igrace a nije dozvoljena grupa!')
                        DropPlayer(samotest, porukazacheatera)
                    end
                end
            end
        end
    end
end)
