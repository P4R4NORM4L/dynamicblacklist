WEAPONS_EXAMPLE = {
    'weapon_railgun',
    'weapon_rayminigun',
    'weapon_raycarbine',
    'weapon_raypistol',
}

Restricted = {
    ['vehicles'] = {
        -- vehicles that are locked for everyone (including admins)
        'stockade3',
        -- vehicles only admins can use
        ['admin'] = {
            'admincar2',
        },
        -- vehicles only moderators (and above) can use
        ['moderator'] = {
            'admincar1',
        },
    },
    
    ['peds'] = {
        ['admin'] = {
            'adminped',
        },
        ['moderator'] = {
            'modped',
        },
        'mp_f_stripperlite',
    },
    
    ['weapons'] = {
        -- You can also define your own ace permission
        ['customAce'] = {},
        ['moderator'] = {
            'weapon_railgun',
            'weapon_rayminigun',
            'weapon_raycarbine',
            'weapon_raypistol',
        },
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

-- Instead of a blacklist, you can make this a whitelist
Inverted = false

-- If your server uses a vehicle spawner/menu, enable this to
-- automatically delete blacklisted vehicles a player spawns
VehicleNoSpawn = true

-- Whether the vehicle blacklist only kicks them from
-- the vehicle if they're in the driver's seat
VehicleDriverBlacklist = true

Inherits = { -- The order to inherit from. You can also do this manually by adding 'add_ace dblacklist.admin dblacklist.moderator allow' etc for each ace
    'customAce',
    'admin',
    'moderator',
}

-- Once done configuring, add 'add_ace group.admin dblacklist.admin'
-- and 'add_ace group.moderator dblacklist.moderator' to your server.cfg