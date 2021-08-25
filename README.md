# DynamicBlacklist

## About

[DynamicBlacklist](https://github.com/MrGriefs/dynamicblacklist) allows you to specify blacklisted vehicles, peds, weapons and weapon ammo types using FiveM's native ACE permissions.  

## Get Started

- Install to your `resource` folder:

```sh
$ git clone https://github.com/MrGriefs/dynamicblacklist.git
```

- Setup the `config.lua`
- Add the following to your `server.cfg`:
  - `start dynamicblacklist`
  - `add_ace group.admin dblacklist.admin`
  - `add_ace group.moderator dblacklist.moderator`
- Start your server and if you've set up the config correctly, it'll work. [Reports bugs](https://github.com/MrGriefs/dynamicblacklist/issues)

## Documentation

Each ace permission has it's own category, i.e. `dblacklist.admin.vehicles` can be used to allow admin vehicles and moderator vehicles but not admin weapons, peds or moderator weapons or peds.
