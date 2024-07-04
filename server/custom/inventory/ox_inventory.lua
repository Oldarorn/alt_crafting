if Config.Inventory ~= 'ox_inventory' then
    return
end

local function initializeItemNames()
    itemNames = {}
    local items = ox_inventory:Items()
    local itemsList = {}
    
    for item, data in pairs(items) do
        table.insert(itemsList, {value = item, label = string.format("%s (%s)", data.label, item)})
    end
    
    local index = 1
    local batchSize = 100
    
    CreateThread(function()
        while index <= #itemsList do
            for i = 1, batchSize do
                if index > #itemsList then break end
                table.insert(itemNames, itemsList[index])
                index = index + 1
            end
            Wait(0)
        end
    end)
end

AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() and not itemNames then
        repeat
            Wait(100)
        until GetResourceState('ox_inventory') == "started"
        
        initializeItemNames()
    end
end)