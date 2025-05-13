ESX = exports['es_extended']:getSharedObject()

-- === CONFIG === --
Config = {}

Config.Vestiaires = { position = vector3(452.1, -982.3, 30.7), action = 'Vestiaire' }
Config.Garages = { position = vector3(445.9, -982.1, 30.7), action = 'Garage' }
Config.Armurerie = { position = vector3(459.4, -983.7, 30.7), action = 'Armurerie' }
Config.BossMenu = { position = vector3(470.3, -981.5, 30.7), action = 'Menu Boss' }
Config.CoffreSaisie = { position = vector3(462.1, -984.5, 30.7), action = 'Coffre Saisie' }
Config.HandcuffItem = "handcuff" -- Nom de l'item menotte (à adapter)

Config.Blips = {
    { coords = vector3(452.1, -982.3, 30.7), sprite = 60, color = 29, name = "Commissariat" }
}

-- === MENUS === --
local open = false
local enService = false
local appels = {}
local blipsRenforts = {}

local menuPrincipal = RageUI.CreateMenu("Police", "Menu F6")
local citoyenMenu = RageUI.CreateSubMenu(menuPrincipal, "Citoyen", "Gestion citoyen")
local vehiculeMenu = RageUI.CreateSubMenu(menuPrincipal, "Véhicule", "Gestion véhicule")
local renfortMenu = RageUI.CreateSubMenu(menuPrincipal, "Renfort", "Demande de renfort")
local appelMenu = RageUI.CreateSubMenu(menuPrincipal, "Centrale", "Appels reçus")

-- === KEYMAPPING === --
RegisterKeyMapping('f6police', 'Menu Police F6', 'keyboard', 'F6')

RegisterCommand("f6police", function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == "police" then
        open = not open
        RageUI.Visible(menuPrincipal, open)
    end
end)

-- === MENU THREAD === --
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if open then
            RageUI.IsVisible(menuPrincipal, true, true, true, function()
                if not enService then
                    RageUI.Button("~g~Prendre son service", nil, {}, true, {
                        onSelected = function()
                            enService = true
                            ESX.ShowNotification("Vous êtes ~b~en service.")
                        end
                    })
                else
                    RageUI.Separator("~b~En service")
                    RageUI.Button("Gestion Citoyen", nil, {}, true, {}, citoyenMenu)
                    RageUI.Button("Gestion Véhicule", nil, {}, true, {}, vehiculeMenu)
                    RageUI.Button("Demande de Renfort", nil, {}, true, {}, renfortMenu)
                    RageUI.Button("Centrale d'appel", nil, {}, true, {}, appelMenu)
                    RageUI.Button("~r~Fin de service", nil, {}, true, {
                        onSelected = function()
                            enService = false
                            ESX.ShowNotification("Vous êtes ~r~hors service.")
                        end
                    })
                end
            end)

            RageUI.IsVisible(citoyenMenu, true, true, true, function()
                RageUI.Button("Lire les droits Miranda", nil, {}, true, {
                    onSelected = function()
                        ESX.ShowNotification("Vous avez le droit de garder le silence...")
                    end
                })

                RageUI.Button("Menotter/Démenotter", nil, {}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback("police:hasItem", function(hasItem)
                            if hasItem then
                                TriggerServerEvent("police:toggleCuff")
                            else
                                ESX.ShowNotification("~r~Vous n'avez pas de menottes.")
                            end
                        end, Config.HandcuffItem)
                    end
                })

                RageUI.Button("Mettre dans véhicule", nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent("police:putInVehicle")
                    end
                })

                RageUI.Button("Sortir du véhicule", nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent("police:takeOutVehicle")
                    end
                })

                RageUI.Button("Fouiller", nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent("police:searchPlayer")
                    end
                })
            end)

            RageUI.IsVisible(vehiculeMenu, true, true, true, function()
                RageUI.Button("Mettre en fourrière", nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent("police:impoundVehicle")
                    end
                })

                RageUI.Button("Crocheter véhicule", nil, {}, true, {
                    onSelected = function()
                        TriggerEvent("police:lockpickVehicle")
                    end
                })
            end)

            RageUI.IsVisible(renfortMenu, true, true, true, function()
                RageUI.Button("Code 2 (Patrouille)", nil, {}, true, {
                    onSelected = function()
                        sendReinforcement(2)
                    end
                })

                RageUI.Button("Code 3 (Intervention)", nil, {}, true, {
                    onSelected = function()
                        sendReinforcement(3)
                    end
                })

                RageUI.Button("Code 99 (Urgence)", nil, {}, true, {
                    onSelected = function()
                        sendReinforcement(99)
                    end
                })
            end)

            RageUI.IsVisible(appelMenu, true, true, true, function()
                if #appels == 0 then
                    RageUI.Separator("~c~Aucun appel en attente")
                else
                    for _, data in pairs(appels) do
                        RageUI.Button(data.message, nil, {}, true, {
                            onSelected = function()
                                SetNewWaypoint(data.coords.x, data.coords.y)
                                ESX.ShowNotification("~b~Point GPS placé.")
                            end
                        })
                    end
                end
            end)
        end
    end
end)

-- === RENFORTS === --
function sendReinforcement(code)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local label, color

    if code == 2 then
        label, color = "Code 2 - Patrouille", 2
    elseif code == 3 then
        label, color = "Code 3 - Intervention", 47
    elseif code == 99 then
        label, color = "Code 99 - Urgence", 1
    end

    TriggerServerEvent("police:sendReinforcement", coords, label, color)
end

RegisterNetEvent("police:createBlip")
AddEventHandler("police:createBlip", function(coords, label, color)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, 161)
    SetBlipScale(blip, 1.2)
    SetBlipColour(blip, color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)

    table.insert(blipsRenforts, blip)
    Wait(30000)
    RemoveBlip(blip)
end)

-- === CENTRALE APPEL === --
RegisterNetEvent("police:receiveCall")
AddEventHandler("police:receiveCall", function(data)
    table.insert(appels, data)
    ESX.ShowNotification("~o~Nouvel appel :~s~ " .. data.message)
end)

--- === BLIPS FIXES === --
Citizen.CreateThread(function()
    for _, blipData in pairs(Config.Blips) do
        local blip = AddBlipForCoord(blipData.coords)
        SetBlipSprite(blip, blipData.sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.9)
        SetBlipColour(blip, blipData.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blipData.name)
        EndTextCommandSetBlipName(blip)
    end
end)


Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerPos = GetEntityCoords(PlayerPedId())  -- On récupère bien les coordonnées du joueur

        -- On vérifie si playerPos est bien valide
        if playerPos ~= nil then
            local playerPos4 = vector4(playerPos.x, playerPos.y, playerPos.z, 0.0)

            -- Interaction pour le Vestiaire
            if #(playerPos4 - Config.Vestiaires.position) < Config.InteractionDistance then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au ~b~vestiaire")
                if IsControlJustPressed(0, 38) then
                    TriggerEvent("skjobpolice:interaction", "vestiaire")
                end
            end

            -- Interaction pour le Garage
            for _, garagePos in pairs(Config.Garages) do
                if #(playerPos4 - garagePos) < Config.InteractionDistance then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au ~b~garage")
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent("skjobpolice:interaction", "garage")
                    end
                end
            end

            -- Interaction pour l'Armurerie
            if #(playerPos4 - Config.Armurerie) < Config.InteractionDistance then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder à l’~b~armurerie")
                if IsControlJustPressed(0, 38) then
                    TriggerEvent("skjobpolice:interaction", "armurerie")
                end
            end

            -- Interaction pour le Menu du Boss
            if #(playerPos4 - Config.BossMenu) < Config.InteractionDistance then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au ~b~menu du boss")
                if IsControlJustPressed(0, 38) then
                    TriggerEvent("skjobpolice:interaction", "boss")
                end
            end

            -- Interaction pour le Coffre de saisie
            if #(playerPos4 - Config.CoffreSaisie) < Config.InteractionDistance then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au ~b~coffre de saisie")
                if IsControlJustPressed(0, 38) then
                    TriggerEvent("skjobpolice:interaction", "coffre")
                end
            end
        else
            print("Erreur : playerPos est nil, les coordonnées du joueur n'ont pas été récupérées.")
        end
    end
end)

-- Interaction
RegisterNetEvent("skjobpolice:interaction")
AddEventHandler("skjobpolice:interaction", function(action)
    ESX.ShowNotification("Vous avez interagi avec : ~b~" .. action)
    -- Tu peux ajouter ici l'ouverture de menus ou autre selon l'action
end)
