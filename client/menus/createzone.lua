RegisterNetEvent('alt_crafting:createZone')
AddEventHandler('alt_crafting:createZone', function(jobs)
    local pos = GetEntityCoords(cache.ped)
    local items = lib.callback.await('alt_crafting:getCraftList', false)

    if next(items) == nil then
        lib.notify({type='error', title = locale('generic_error'), description = locale('zone_no_craft'), duration = 5000})
        return
    end
    local creator = lib.inputDialog(locale('create_zone_header'), {
        {type = 'input', label = locale('create_zone_id'), description = locale('create_zone_id_desc'), required = true},
        {type = 'multi-select', label = locale('authorized_groups'), searchable = true, options = jobs},
        {type = 'color', label = locale('marker_color'), format = 'rgba', default = 'rgba(255, 255, 255, 200)'},
        {type = 'checkbox', label = locale('display_marker'), checked = true},
        {type = 'multi-select', label = locale('possible_crafts'), searchable = true, options = items, required = true},
        {type = 'input', label = locale('notification_text'), description = locale('notification_text_desc'), required = true},
    })

    if not creator then return end

    local uiText = '[E] - ' .. creator[6]

    local newLoc = {
        coords = pos,
        id = creator[1],
        groups = creator[2] or {},
        colours = creator[3],
        showMarker = creator[4],
        crafts = creator[5],
        uiText = uiText
    }

    TriggerServerEvent('alt_crafting:addNewZone', newLoc)
end)
