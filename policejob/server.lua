ESX = exports['es_extended']:getSharedObject()

-- Vérification si le joueur a l'item requis
ESX.RegisterServerCallback("police:hasItem", function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local hasItem = xPlayer.getInventoryItem(item).count > 0
    cb(hasItem)
end)

-- Menotter ou démenotter
RegisterServerEvent("police:toggleCuff")
AddEventHandler("police:toggleCuff", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local target = GetClosestPlayer(src)
    if target then
        TriggerClientEvent("police:toggleCuff", target)
    end
end)

-- Mettre dans véhicule
RegisterServerEvent("police:putInVehicle")
AddEventHandler("police:putInVehicle", function()
    local src = source
    local target = GetClosestPlayer(src)
    if target then
        TriggerClientEvent("police:putInVehicle", target)
    end
end)

-- Sortir du véhicule
RegisterServerEvent("police:takeOutVehicle")
AddEventHandler("police:takeOutVehicle", function()
    local src = source
    local target = GetClosestPlayer(src)
    if target then
        TriggerClientEvent("police:takeOutVehicle", target)
    end
end)

-- Fouiller
RegisterServerEvent("police:searchPlayer")
AddEventHandler("police:searchPlayer", function()
    local src = source
    local target = GetClosestPlayer(src)
    if target then
        TriggerClientEvent("police:searchMenu", src, target)
    end
end)

-- Impound
RegisterServerEvent("police:impoundVehicle")
AddEventHandler("police:impoundVehicle", function()
    TriggerClientEvent("police:impoundNearestVehicle", source)
end)

-- Lockpick (Crochetage)
RegisterServerEvent("police:lockpickVehicle")
AddEventHandler("police:lockpickVehicle", function()
    TriggerClientEvent("police:lockpickVehicleClient", source)
end)

-- Envoi des renforts
RegisterServerEvent("police:sendReinforcement")
AddEventHandler("police:sendReinforcement", function(coords, label, color)
    local xPlayers = ESX.GetExtendedPlayers("job", "police")
    for _, xPlayer in pairs(xPlayers) do
        TriggerClientEvent("police:createBlip", xPlayer.source, coords, label, color)
    end
    TriggerClientEvent("esx:showAdvancedNotification", -1, "Police", "Renfort", label .. " demandé.", "CHAR_CALL911", 1)
end)

-- Envoi central des appels
RegisterCommand("appelpolice", function(source, args, raw)
    local msg = table.concat(args, " ")
    if msg and msg ~= "" then
        local src = source
        local ped = GetPlayerPed(src)
        local coords = GetEntityCoords(ped)

        local appel = {
            message = msg,
            coords = coords
        }

        local xPlayers = ESX.GetExtendedPlayers("job", "police")
        for _, xPlayer in pairs(xPlayers) do
            TriggerClientEvent("police:receiveCall", xPlayer.source, appel)
        end

        TriggerClientEvent("esx:showNotification", src, "Appel envoyé à la police.")
    end
end, false)

-- Fonction utilitaire pour récupérer le joueur le plus proche
function GetClosestPlayer(src)
    local players = ESX.GetExtendedPlayers()
    local srcPed = GetPlayerPed(src)
    local srcCoords = GetEntityCoords(srcPed)
    local closestDist = -1
    local closestPlayer = nil

    for _, xPlayer in pairs(players) do
        local targetId = xPlayer.source
        if targetId ~= src then
            local targetPed = GetPlayerPed(targetId)
            local targetCoords = GetEntityCoords(targetPed)
            local dist = #(srcCoords - targetCoords)

            if closestDist == -1 or dist < closestDist then
                closestDist = dist
                closestPlayer = targetId
            end
        end
    end

    return closestPlayer
end
