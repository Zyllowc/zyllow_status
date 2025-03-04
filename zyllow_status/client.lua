Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SendNUIMessage({
            action = "show"
        })
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        local players = GetNumberOfPlayers()
        local serverName = Config.ServerName

        TriggerServerEvent('zyllow_ui:requestPing')
        
        SendNUIMessage({
            action = "updatePlayers",
            playersCount = players
        })

        SendNUIMessage({
            action = "setServerName",
            serverName = serverName
        })
    end
end)

RegisterNetEvent('zyllow_ui:sendPing')
AddEventHandler('zyllow_ui:sendPing', function(ping)
    SendNUIMessage({
        action = "updatePing",
        ping = ping
    })
end)
