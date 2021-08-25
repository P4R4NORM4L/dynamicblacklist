WEAPONS_EXAMPLE = {
    'weapon_railgun',
    'weapon_rayminigun',
    'weapon_raycarbine',
    'weapon_raypistol',
}

Restricted = {
    ['vehicles'] = {
        ['admin'] = { -- vehicles only admins can use
            'admincar2',
        },
        ['moderator'] = { -- vehicles only moderators (and above) can use
            'admincar1',
        }, -- vehicles that are locked for everyone
        'stockade3',
    },
    
    ['peds'] = {
        ['admin'] = { -- peds only admins can use
            'adminped',
        },
        ['moderator'] = { -- peds only moderators (and above) can use
            'modped',
        }, -- peds that are locked for everyone
        'mp_f_stripperlite',
    },
    
    ['weapons'] = {
        ['customAce'] = {}, -- weapons only customAce can use
        ['moderator'] = { -- weapons only moderators (and above) can use
            'weapon_railgun',
            'weapon_rayminigun',
            'weapon_raycarbine',
            'weapon_raypistol',
        }, -- weapons no-one can use
        'weapon_minigun',
        'weapon_snowball',
    },
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