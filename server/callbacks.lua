lib.callback.register('alt_crafting:getCraftList', function(source)
    local filePath = './datas/recipes.json'
    local file = LoadResourceFile(GetCurrentResourceName(), filePath)
    local craftData = json.decode(file)
    local items = {}
    
    for _, item in ipairs(craftData) do
        for k, v in pairs(item) do
            table.insert(items, {value = k, label = v.label})
        end
    end
    
    return items
end)

lib.callback.register('alt_crafting:requestLocations', function(source)
    local filePath = './datas/locations.json'
    local file = LoadResourceFile(GetCurrentResourceName(), filePath)
    local locData = json.decode(file)

    return locData
end)