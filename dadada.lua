local ukupniigraci = {}
RegisterNetEvent("esx_tinkyantiblipovi:igraci")
AddEventHandler("esx_tinkyantiblipovi:igraci", function(igraci)
    ukupniigraci = igraci
end)

CreateThread(function()
    while true do
        Wait(2500) -- 2500..
            --for k, v in pairs(ukupniigraci) do -- za infinitye
            for k, v in pairs(GetActivePlayers()) do -- za legacy
            --Wait(50)
            local idigraca = tonumber(v)
            local odservera = GetPlayerFromServerId(idigraca)
            local igrac = GetPlayerPed(odservera) 
            local blipnamapi = GetBlipFromEntity(igrac)
            local postojili = DoesBlipExist(blipnamapi)
            if postojili then
                TriggerServerEvent("esx_tinkyantiblipovi:ugasiigraca")
                break-- ugasi loop..
            end
        end
    end
end)