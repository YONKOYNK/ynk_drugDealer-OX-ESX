ESX = exports['es_extended']:getSharedObject()


exports('turbozen', function()
    TriggerServerEvent("ox_inventory:useItem", "turbozen")
    TriggerEvent('ynk_drugDealer:useTurbozen')
end)

exports('ragerush', function()
    TriggerServerEvent("ox_inventory:useItem", "ragerush")
    TriggerEvent('ynk_drugDealer:useRageRush')
end)

exports('dreamweed', function()
  TriggerServerEvent("ox_inventory:useItem", "dreamweed")
    TriggerEvent('ynk_drugDealer:useDreamweed')
end)

exports('nocturna', function()
  TriggerServerEvent("ox_inventory:useItem", "nocturna")
    TriggerEvent('ynk_drugDealer:useNocturna')
end)



RegisterNetEvent('ynk_drugDealer:useTurbozen', function()
    print('Tu as pris de la turbozen')

    lib.progressBar({
        duration = 2000,
        label = 'Turbozen',
        useWhileDead = false,
        canCancel = true,
        disable = {car = true},
        anim = {dict = 'mp_player_intdrink', clip = 'loop_bottle'},
    })

    local player = PlayerPedId()
    StartScreenEffect('DrugsTrevorClownsFight', 0, true)
    RequestAnimSet('move_m@buzzed')
    SetPedMovementClipset(player, "move_m@buzzed", 1.0)

    Wait(Config.drugs[1].time)

    StopScreenEffect('DrugsTrevorClownsFight')
    ResetPedMovementClipset(player, 0.25)
end)





RegisterNetEvent('ynk_drugDealer:useRageRush', function()
    print('Tu as pris de la ragerush')

    local player = PlayerPedId()
    lib.progressBar({
        duration = 2000,
        label = 'Rage Rush',
        useWhileDead = false,
        canCancel = true,
        disable = {car = true},
        anim = {dict = 'mp_player_intdrink', clip = 'loop_bottle'},
    })

    local playerSpeed = GetEntitySpeed(player)
    StartScreenEffect('Dont_tazeme_bro', 0, true)
    RequestAnimSet('move_m@depressed@a')
    SetPedMovementClipset(player, 'move_m@depressed@a', 1.0)
    SetRunSprintMultiplierForPlayer(player, playerSpeed * 1.49)

    Wait(Config.drugs[2].time)

    StopScreenEffect('Dont_tazeme_bro')
    ResetPedMovementClipset(player, 0.25)
end)

RegisterNetEvent('ynk_drugDealer:useDreamweed', function()
    print('Tu as pris de la dreamweed')

    lib.progressBar({
        duration = 2000,
        label = 'Dream Weed',
        useWhileDead = false,
        canCancel = true,
        disable = {car = true},
        anim = {dict = 'mp_player_intdrink', clip = 'loop_bottle'},
    })

    local ped = PlayerPedId()
    SetTimecycleModifier("DrugsMichaelAliensFight")
    SetPedMotionBlur(ped, true)
    ShakeGameplayCam("DRUNK_SHAKE", 1.0)
    StartScreenEffect("DMT_flight_intro", 0, false)
    RequestAnimSet("move_m@tool_belt@a")
    SetPedMovementClipset(ped, "move_m@tool_belt@a", 1.0)

    Wait(Config.drugs[4].time)

    StopScreenEffect("DMT_flight_intro")
    ClearTimecycleModifier()
    SetPedMotionBlur(ped, false)
    StopGameplayCamShaking(false)
    ResetPedMovementClipset(ped, 0.5)
end)

RegisterNetEvent('ynk_drugDealer:useNocturna', function()
    print('Tu as pris de la nocturna')

    local ped = PlayerPedId()
    lib.progressBar({
        duration = 2000,
        label = 'Nocturna',
        useWhileDead = false,
        canCancel = true,
        disable = {car = true},
        anim = {dict = 'mp_player_intdrink', clip = 'loop_bottle'},
    })

    SetTimecycleModifier("MP_corona_switch")
    StartScreenEffect("ExplosionJosh3", 0, true)
    ShakeGameplayCam("LARGE_EXPLOSION_SHAKE", 1.0)

    RequestAnimDict("move_crawl")
    while not HasAnimDictLoaded("move_crawl") do Wait(100) end

    TaskPlayAnim(ped, "move_crawl", "onfront_fwd", 8.0, -8.0, -1, 1, 0, false, false, false)

    Wait(Config.drugs[3].time)

    StopGameplayCamShaking()
    StopScreenEffect("ExplosionJosh3")
    ClearTimecycleModifier()
    ClearPedTasks(ped)
end)


function giveItem(price, item, amount)
    local input = lib.inputDialog('Dialog title', {
    {type = 'number', label = 'Quantite', description = 'Demande la quantite'},
    {type = 'input', label = 'Confirmation', description = 'oui / non ', required = true, max = 3},
})
 
    local amount = tonumber(input[1])
if not amount or input[2] == nil then
    ESX.ShowNotification("Ajoute la quantité et confirme")
elseif input[2]:lower() == 'oui' then
    TriggerServerEvent('payDrugs', price, item, amount)
end

end


-------------------------------------------------------------------------------------------------------

lib.registerContext({
  id = 'some_menu',
  title = 'Drug Dealer',
  options = {
    {
      title = Config.drugs[1].label,
      icon = 'capsules',
      iconColor = 'yellow',
      onSelect = function()
        giveItem(Config.drugs[1].price, "turbozen", amount)
      end,
    },
    {
      title = Config.drugs[2].label,
      icon = 'capsules',
      iconColor = 'red',
      onSelect = function()
        giveItem(Config.drugs[2].price, "ragerush", amount)
      end,
    },
    {
      title = Config.drugs[3].label,
      icon = 'capsules',
      iconColor = 'blue',
      onSelect = function()
        giveItem(Config.drugs[3].price, "nocturna", amount)
      end,
    },
    {
      title = Config.drugs[4].label,
      icon = 'capsules',
      iconColor = 'green',
      onSelect = function()
        giveItem(Config.drugs[4].price, "dreamweed", amount)
      end,
    }
    }
})



local ped = Config.ped[1].name
local pedhash = GetHashKey(ped)
local pedPosition = Config.ped[1].position


RequestModel(pedhash)
while not HasModelLoaded(pedhash) do
    Wait(100)
end

local pedCreated = CreatePed(8, pedhash, pedPosition.x, pedPosition.y, pedPosition.z, 0.0, true, false)
Wait(1000)
FreezeEntityPosition(pedCreated, true)

Citizen.CreateThread(function ()
    local player = PlayerPedId()
    while true do
        Wait(0)
        local playerPos = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(pedPosition.x, pedPosition.y, pedPosition.z, playerPos.x, playerPos.y, playerPos.z)
        if not IsEntityDead(player) and not IsPedInAnyVehicle(player, false) then
            if distance <= 1 and IsControlJustPressed(0, 38) then
                print('tu vient douvrire le menu de drogue ')
                lib.showContext("some_menu")

            end
        end
    end
end)
