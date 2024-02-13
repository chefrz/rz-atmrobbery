![image](https://cdn.discordapp.com/attachments/1186357096216801381/1207041334884442212/vATMROBnner.png?ex=65de33d7&is=65cbbed7&hm=060d9913acffec45aac272918aa9d334797a7e136404ad9559aa714974390c36&)

# rz-atmrobbery
- Atm Robbery [QBCORE]
- New QBCore

## Showcase
- https://youtu.be/4kOLxsbiU1k
## Discord
- https://discord.gg/zertxMj7Yh

## Updtate
- Dispatch installation edited and new ps-dispatch adapted.

## Features
- Basic Config
- Low Resmon
- Script using full qb-target
- Easy editable language file

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/qbcore-framework/qb-target)
- [ps-ui](https://github.com/Project-Sloth/ps-ui)
- [ps-dispatch](https://github.com/Project-Sloth/ps-dispatch)

## Installation

### Dispatch
- Add the following code to your `ps-dispatch/client/alerts.lua`

```
local function AtmRobbery()
    local coords = GetEntityCoords(cache.ped)
    local dispatchData = {
        message = locale('atmrobbery'),
        codeName = 'atmrobbery',
        code = '10-10',
        icon = 'fab fa-artstation',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'leo'}
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('AtmRobbery', AtmRobbery)
```

- Add the following code to your `ps-dispatch/shared/config.lua/Config.Blips`
```
    ['atmrobbery'] = {
        radius = 0,
        sprite = 52,
        color = 1,
        scale = 1.5,
        length = 2,
        sound = 'Lose_1st',
        sound2 = 'robberysound',
        offset = false,
        flash = false
    },
```

- Add the following code to your `ps-dispatch/locales`
```
"atmrobbery": "Atm Robbery",
```


### Script
- Download the script and put it in the `[qb]` directory.
- Add the following code to your server.cfg/resouces.cfg
```
ensure rz-atmrobbery
```
