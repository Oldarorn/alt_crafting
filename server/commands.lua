lib.addCommand('createCraftLoc', {
    help = locale("location_command_help"),
    restricted = 'group.admin'
}, function(source, args, raw)
    local Jobs = {}
    for k, v in pairs(GetJobs()) do
        table.insert(Jobs, {value = k, label = v.label})
    end

    TriggerClientEvent('alt_crafting:createZone', source, Jobs)
end)

lib.addCommand('createCraft', {
    help = locale("craft_command_help"),
    restricted = 'group.admin'
}, function(source, args, raw)
    TriggerClientEvent('alt_crafting:createCraft', source, itemNames)
end)