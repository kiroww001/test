ESX = exports['es_extended']:getSharedObject()

local open = false
local menuPrincipal = RageUI.CreateMenu("Police", "Menu F6")
local citoyenMenu = RageUI.CreateSubMenu(menuPrincipal, "Citoyen", "Gestion citoyen")
local vehiculeMenu = RageUI.CreateSubMenu(menuPrincipal, "Véhicule", "Gestion véhicule")
local renfortMenu = RageUI.CreateSubMenu(menuPrincipal, "Renfort", "Demande de renfort")
local appelMenu = RageUI.CreateSubMenu(menuPrincipal, "Centrale", "Appels reçus")

local enService = false
local appels = {}
local blipsRenforts = {}

RegisterKeyMapping('f6police', 'Menu Police F6', 'keyboard', 'F6')

RegisterCommand("f6police", function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == "police" then
        open = not open
        RageUI.Visible(menuPrincipal, open)
    end
end)

-- Gestion menu
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
                    RageUI.Separator("Aucun appel en attente")
                else
                    for _, data in pairs(appels) do
                        RageUI.Button(data.message, nil, {}, true, {
                            onSelected = function()
                                SetNewWaypoint(data.coords.x, data.coords.y)
                                ESX.ShowNotification("Point GPS placé.")
                            end
                        })
                    end
                end
            end)
        end
    end
end)

-- Système de renfort
function sendReinforcement(code)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    local color = 1
    local label = "Renfort"

    if code == 2 then
        color = 2
        label = "Code 2 - Vert"
    elseif code == 3 then
        color = 47
        label = "Code 3 - Orange"
    elseif code == 99 then
        color = 1
        label = "Code 99 - Rouge"
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

    Wait(30 * 1000) -- 30 secondes
    RemoveBlip(blip)
end)

-- Centrale appel
RegisterNetEvent("police:receiveCall")
AddEventHandler("police:receiveCall", function(data)
    table.insert(appels, data)
    ESX.ShowNotification("~o~Appel reçu :~s~ " .. data.message)
end)
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

-- Initialisation des variables globales de configuration
Config = {}

-- Définition des emplacements des différents menus et zones du job de police
Config.Vestiaires = {
    position = vector3(452.1, -982.3, 30.7),  -- Position des vestiaires
    action = 'Vestiaire'  -- Action à effectuer
}

Config.Garages = {
    position = vector3(445.9, -982.1, 30.7),  -- Position du garage
    action = 'Garage'  -- Action à effectuer
}

Config.Armurerie = {
    position = vector3(459.4, -983.7, 30.7),  -- Position de l'armurerie
    action = 'Armurerie'  -- Action à effectuer
}

Config.BossMenu = {
    position = vector3(470.3, -981.5, 30.7),  -- Position du menu boss
    action = 'Menu Boss'  -- Action à effectuer
}

Config.CoffreSaisie = {
    position = vector3(462.1, -984.5, 30.7),  -- Position du coffre de saisie
    action = 'Coffre Saisie'  -- Action à effectuer
}

-- Vérification si toutes les tables de configuration sont bien définies
local function verifyConfig()
    if Config.Vestiaires and Config.Garages and Config.Armurerie and Config.BossMenu and Config.CoffreSaisie then
        print("Toutes les tables sont correctement définies.")
    else
        print("Erreur : Certaines tables de configuration sont manquantes.")
    end
end

-- Affichage des définitions dans le console pour s'assurer que tout est bien chargé
verifyConfig()

-- Fonction d'interaction avec un objet ou une zone spécifique
local function interactWithArea(area)
    if area == 'Vestiaire' then
        print("Interaction avec le vestiaire.")
    elseif area == 'Garage' then
        print("Interaction avec le garage.")
    elseif area == 'Armurerie' then
        print("Interaction avec l'armurerie.")
    elseif area == 'Menu Boss' then
        print("Interaction avec le menu boss.")
    elseif area == 'Coffre Saisie' then
        print("Interaction avec le coffre de saisie.")
    else
        print("Aucune interaction valide pour cette zone.")
    end
end

-- Exemple d'activation des interactions en fonction de la position du joueur
local function onPlayerNearArea(playerPosition)
    if #(playerPosition - Config.Vestiaires.position) < 3.0 then
        interactWithArea(Config.Vestiaires.action)
    elseif #(playerPosition - Config.Garages.position) < 3.0 then
        interactWithArea(Config.Garages.action)
    elseif #(playerPosition - Config.Armurerie.position) < 3.0 then
        interactWithArea(Config.Armurerie.action)
    elseif #(playerPosition - Config.BossMenu.position) < 3.0 then
        interactWithArea(Config.BossMenu.action)
    elseif #(playerPosition - Config.CoffreSaisie.position) < 3.0 then
        interactWithArea(Config.CoffreSaisie.action)
    end
end

-- Boucle d'interaction permanente en fonction de la position du joueur (exécution côté client)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)  -- Attendre un tick pour éviter de surcharger le serveur

        local playerPos = GetEntityCoords(PlayerPedId())  -- Récupérer la position du joueur
        onPlayerNearArea(playerPos)  -- Vérifier et interagir si proche d'une zone
    end
end)
