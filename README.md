# rz-atmrobbery
- Atm Robbery [QBCORE]
- New QBCore

## Features
- Basic Config
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
- Add the following code to your `ps-dispatch/client/cl_events`
```
local function AtmrRobbery(camId)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "atmrobbery",
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        camId = camId,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('atmrobbery'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('AtmrRobbery', AtmrRobbery)

```
- Add the following code to your `ps-dispatch/server/sv_dispatchcodes`
```
["atmrobbery"] =  {displayCode = '10-90', description = "Atm Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 52, blipColour = 1, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false", blipflash = "false"},

```


### Script
- Download the script and put it in the `[qb]` directory.
- Add the following code to your server.cfg/resouces.cfg
```
ensure rz-atmrobbery
```
## Showcase
- https://youtu.be/4kOLxsbiU1k
## Discord
- https://discord.gg/zertxMj7Yh
