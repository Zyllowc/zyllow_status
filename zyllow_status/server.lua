local playerPings = {}

RegisterServerEvent('zyllow_ui:requestPing')
AddEventHandler('zyllow_ui:requestPing', function()
    local src = source
    local ping = playerPings[src] or GetPlayerPing(src)
    
    TriggerClientEvent('zyllow_ui:sendPing', src, ping)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        for _, playerId in ipairs(GetPlayers()) do
            playerPings[playerId] = GetPlayerPing(playerId)
        end
    end
end)
