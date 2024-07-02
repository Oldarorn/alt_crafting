local itemNames = nil

local function initializeItemNames()
    itemNames = {}
    for item, data in pairs(ox_inventory:Items()) do
        table.insert(itemNames, {value = item, label = string.format("%s (%s)", data.label, item)})
    end
end

AddEventHandler('onServerResourceStart', function(resourceName)
    if (resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName()) and not itemNames then
        lib.versionCheck('Oldarorn/alt_crafting')
        initializeItemNames()
    end
end)
