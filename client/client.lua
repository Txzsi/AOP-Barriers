local current_aop = config.setup.default_aop
local barrier = {}

AddEventHandler('playerSpawned', function ()
    TriggerServerEvent('get:aop')
end)

RegisterNetEvent('returned:aop')
AddEventHandler('returned:aop', function (aop)
    current_aop = aop
end)

RegisterNetEvent("AOPCHANGE")
AddEventHandler("AOPCHANGE", function(aop)
    current_aop = aop
    if current_aop == config.setup.sandy_barrier_trigger_aop then
        SpawnSandyBarrier()
    elseif current_aop == config.setup.city_barrier_trigger_aop then
        SpawnCityBarrier()
    else
        DeleteBarrier()
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        aop_draw(config.setup.aop_draw_text .. ' ' .. current_aop)
    end
end)

function SpawnSandyBarrier()
    for i, v in ipairs(config.sandy_barrier_location) do
        local Object = 'prop_fnclink_09e'
        RequestModel(Object)
        while not HasModelLoaded(Object) do
            Citizen.Wait(0)
        end
        local Prop = CreateObject(Object, v.x, v.y, v.z, false, false, false)
        SetEntityAlpha(Prop, 0)
        SetEntityHeading(Prop, v.heading)
        FreezeEntityPosition(Prop, true)
        PlaceObjectOnGroundProperly(Prop)
        SetEntityAsMissionEntity(Prop, true, true)
        table.insert(barrier, Prop)
    end
end

function SpawnCityBarrier()
    for i, v in ipairs(config.city_barrier_location) do
        local Object = 'prop_fnclink_09e'
        RequestModel(Object)
        while not HasModelLoaded(Object) do
            Citizen.Wait(0)
        end
        local Prop = CreateObject(Object, v.x, v.y, v.z, false, false, false)
        SetEntityAlpha(Prop, 0)
        SetEntityHeading(Prop, v.heading)
        FreezeEntityPosition(Prop, true)
        PlaceObjectOnGroundProperly(Prop)
        SetEntityAsMissionEntity(Prop, true, true)
        table.insert(barrier, Prop)
    end
end

function DeleteBarrier()
    for k, v in pairs(barrier) do
        if v ~= nil then
            DeleteEntity(v)
        end
    end
end

function aop_draw(text)
    SetTextFont(4)
    SetTextScale(0.44, 0.44)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(config.setup.text_position_x, config.setup.text_position_y)
end
