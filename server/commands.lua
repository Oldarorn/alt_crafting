lib.addCommand('addCraftLoc', {
    help = locale("location_command_help"),
    restricted = 'group.admin'
}, function(source, args, raw)
    TriggerClientEvent('alt_crafting:createZone', source, Jobs, Factions)
end)

lib.addCommand('createCraft', {
    help = locale("craft_command_help"),
    restricted = 'group.admin'
}, function(source, args, raw)
    TriggerClientEvent('alt_crafting:createCraft', source)
end)