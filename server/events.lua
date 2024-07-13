RegisterNetEvent('alt_crafting:createItem')
AddEventHandler('alt_crafting:createItem', function(itemTable)
    local _source = source
    local filePath = './datas/recipes.json'
    local file = LoadResourceFile(GetCurrentResourceName(), filePath)
    local data = json.decode(file)

    local itemName = next(itemTable) -- Get the key (item name) from the itemTable

    -- Check if the item name already exists as a key in any recipe
    for _, recipe in ipairs(data) do
        if recipe[itemName] then
            -- Item name already exists, send an error message to the client
            TriggerClientEvent('ox_lib:notify', _source, {type="error", description = locale('error_item_already_exists')})
            return
        end
    end

    table.insert(data, itemTable)

    -- Encode the updated JSON data
    local updatedJson = json.encode(data, { indent = true })

    -- Save the updated JSON file
    SaveResourceFile(GetCurrentResourceName(), filePath, updatedJson, -1)

    -- Optionally, notify the client that the item was successfully created
    TriggerClientEvent('ox_lib:notify', _source, {type="success", description = locale('success_item_created')})
end)

RegisterNetEvent('alt_crafting:addNewZone')
AddEventHandler('alt_crafting:addNewZone', function(zoneTable)
    local filePath = './datas/locations.json'
    local file = LoadResourceFile(GetCurrentResourceName(), filePath)
    local locData = json.decode(file)
    
    local red, green, blue, alpha = zoneTable.colours:match("rgba%((%d+),%s*(%d+),%s*(%d+),%s*([%d.]+)%)")
    local convertAlpha = math.floor(alpha * 255 + 0.5)

    local function createZone(id)
        locData[id] = {
            coords = vec3(zoneTable.coords.x, zoneTable.coords.y, zoneTable.coords.z - 1.0),
            groups = zoneTable.groups,
            showMarker = zoneTable.showMarker,
            colours = {r = tonumber(red), g = tonumber(green), b = tonumber(blue), a = tonumber(convertAlpha)},
            crafts = zoneTable.crafts,
            uiText = zoneTable.uiText
        }
        TriggerClientEvent('ox_lib:notify', source, {type = "success", icon = "screwdriver-wrench", description = locale('zone_created', id)})
    end

    if not locData[zoneTable.id] then
        createZone(zoneTable.id)
    else
        local newId
        repeat
            local i = math.random(1111, 9999)
            newId = zoneTable.id .. i
        until not locData[newId]

        createZone(newId)
    end

    local newJson = json.encode(locData, {indent = true})
    SaveResourceFile(GetCurrentResourceName(), filePath, newJson, -1)
    TriggerClientEvent('alt_crafting:refreshZones', -1)
end)
