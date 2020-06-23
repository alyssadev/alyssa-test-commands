-- Shows a notification on the player's screen 
function ShowNotification( text )
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(false, false)
end

RegisterCommand('burn', function(source, args, rawCommand)
    StartEntityFire(PlayerPedId())
end)

RegisterCommand('ungod', function(source, args, rawCommand)
    SetEntityInvincible(PlayerPedId(), false)
end)

RegisterCommand('god', function(source, args, rawCommand)
    SetEntityInvincible(PlayerPedId(), true)
end)

RegisterCommand('mun', function(source, args, rawCommand)
    local veh = args[1]
    StatSetInt(`MP0_WALLET_BALANCE`, tonumber(veh))
end)

RegisterCommand('wep', function(source, args, rawCommand)
    local veh = args[1]
    if veh == nil then veh = "WEAPON_PISTOL50" end
    weaponhash = GetHashKey(veh)
    GiveWeaponToPed(PlayerPedId(), weaponhash, 9999, false, true)
end)

RegisterCommand('npc', function(source, args, rawCommand)
    local npc = args[1]
    local type = args[2]
    if npc == nil then npc = "ig_lestercrest" end
    if type == nil then type = "4" end
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local npc = GetHashKey(npc)
    RequestModel( npc )
    while ( not HasModelLoaded(npc) ) do
        Citizen.Wait(1)
    end
    CreatePed(tonumber(type), npc, x, y, z, GetEntityHeading(PlayerPedId())+90, false, true)
end)
