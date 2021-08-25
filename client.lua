local ClientBlacklist = {
    ['vehicles'] = {},
    ['peds'] = {},
    ['weapons'] = {},
}
local ClientLastModel = GetHashKey('a_m_y_hipster_01')
for i, v in ipairs(WeaponAmmoBannedTypes) do
	WeaponAmmoBannedTypes[v] = true
	WeaponAmmoBannedTypes[i] = nil
end

RegisterNetEvent('dblacklist:setClientBlacklist')
AddEventHandler('dblacklist:setClientBlacklist', function (blacklist)
    ClientBlacklist = blacklist
end)

AddEventHandler('playerSpawned', function ()
    TriggerServerEvent('dblacklist:getClientBlacklist')
end)

TriggerServerEvent('dblacklist:getClientBlacklist')

-- Vehicle blacklist handler
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local ped = PlayerPedId()
        local veh
        if IsPedInAnyVehicle(ped, false) then
            veh = GetVehiclePedIsUsing(ped)
        else
            veh = GetVehiclePedIsTryingToEnter(ped)
        end
        if veh and (not VehicleDriverBlacklist or DoesEntityExist(veh)) then
            local hash = GetEntityModel(veh)
            local driver = GetPedInVehicleSeat(veh, -1)
            if driver == ped then
                if ClientBlacklist.vehicles[hash] then
                    DeleteEntity(veh)
                    ClearPedTasksImmediately(ped)
                    ShowNotification("~y~Hey!~s~ This is ~r~not your vehicle~s~!")
                end
            end
        end
    end
end)

-- Ped blacklist handler
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        local ped = GetPlayerPed(-1)
        local hash = GetEntityModel(ped)
        print(hash)
        if ClientBlacklist.peds[hash] then
            RequestModel(ClientLastModel)
            while not HasModelLoaded(ClientLastModel) do
                Citizen.Wait(400)
            end
            SetPlayerModel(PlayerId(), ClientLastModel)   
            ShowNotification("~y~Hey!~s~ This player model is ~r~not meant for you~s~!")
        else
            ClientLastModel = hash
        end
    end
end)

-- Weapon blacklist handler
Citizen.CreateThread(function()
    local ped = GetPlayerPed(-1)
    while true do
        Citizen.Wait(1000)
        local _, hash = GetCurrentPedWeapon(ped, true)
        if ClientBlacklist.weapons[hash] or WeaponAmmoBannedTypes[GetPedAmmoTypeFromWeapon(ped, hash)] then
            RemoveWeaponFromPed(ped, hash)
            ShowNotification("~y~Hey!~s~ You're ~r~not allowed~s~ to have this weapon!")
        end
    end
end)

function ShowNotification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(message)
    DrawNotification(true, true)
end