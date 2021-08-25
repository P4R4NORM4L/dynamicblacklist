WEAPONS_EXAMPLE = {
    'weapon_railgun',
    'weapon_rayminigun',
    'weapon_raycarbine',
    'weapon_raypistol',
}

Restricted = {
    ['vehicles'] = {
        ['admin'] = {
            -- restricted to nothing
        },
        ['moderator'] = {
            'admincar' -- restricted to the admin's vehicle
        },
        -- everyone else's restrictions
        ['everyone'] = {
            'charger'
        }
    },
    
    ['peds'] = {
        ['admin'] = {
            -- restricted to nothing
        },
        ['moderator'] = {
            'admincar' -- restricted to the admin's vehicle
        },
        -- equivalent to ['everyone'] = { 'mp_f_stripperlite', 'adminped' }
        'mp_f_stripperlite',
        'adminped'
    },
    
    ['weapons'] = {
        ['admin'] = {}, -- you have to include an empty array if you want to restrict nothing
        ['moderator'] = {
            'weapon_railgun',
            'weapon_rayminigun',
            'weapon_raycarbine',
            'weapon_raypistol',
        },
        -- 'everyone' will also inherit 'weapon_railgun', 'weapon_rayminigun', etc from the 'moderator' ace
        ['everyone'] = {
            'weapon_railgun',
            'weapon_nightstick'
        }
    }
}

-- Banned weapon ammunition types. Only valid for Mk II weapons. See ammotypes.lua
WeaponAmmoBannedTypes = {} 
-- WeaponAmmoBannedTypes = {
--     table.unpack(AmmoFMJ),
--     table.unpack(AmmoAP),
--     table.unpack(AmmoIncendiary),
-- }

-- You can modify the ace prefix here
Prefix = 'dblacklist'
-- If your server uses a vehicle spawner/menu, enable this to
-- automatically delete blacklisted vehicles a player spawns
VehicleNoSpawn = true
-- Whether the vehicle blacklist only kicks them from
-- the vehicle if they're in the driver's seat
-- Set to false if you want the player to be affected no matter the seat
VehicleDriverBlacklist = true
Inherits = { -- Automatically inherit whitelist from x.
             -- You can do this manually by adding 'add_ace dblacklist.admin dblacklist.moderator allow' etc for each ace
    ['admin'] = 'moderator', -- admin inherits moderator whitelist
    ['moderator'] = 'everyone' -- moderator inherits everyone whitelist
}

-- Once done configuring, add 'add_ace group.admin dblacklist.admin'
-- and 'add_ace group.moderator dblacklist.moderator' to your server.cfg