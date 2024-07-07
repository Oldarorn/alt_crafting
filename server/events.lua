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
