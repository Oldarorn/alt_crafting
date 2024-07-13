local locations = {}

AddEventHandler('onResourceStart', function(res)
    if GetCurrentResourceName() == res then
        TriggerEvent('alt_crafting:refreshZones')
    end
end)

RegisterNetEvent('alt_crafting:refreshZones')
AddEventHandler('alt_crafting:refreshZones', function()
    locations = {}
    locations = lib.callback.await('alt_crafting:requestLocations', false)
    createZones()
end)

createZones = function()
    for _, v in pairs(locations) do
        local point = lib.points.new({
            coords = vec3(v.coords.x, v.coords.y, v.coords.z),
            distance = 20,
        })


        local marker = lib.marker.new({
            type = Config.MarkerType or 1,
            coords = vec3(v.coords.x, v.coords.y, v.coords.z),
            rotate = true,
            width = 0.5,
            height = 0.25,
            color = { r = v.colours.r, g = v.colours.g, b = v.colours.b, a = v.colours.a }
        })

        function point:nearby()
            if v.showMarker and (checkArray(v.groups, GetJobName()) or #v.groups == 0) then
                marker:draw()
            end

            if self.currentDistance < 1.5 then
                if checkArray(v.groups, GetJobName()) or #v.groups == 0 then
                    if not lib.isTextUIOpen() then
                        lib.showTextUI(v.uiText, {
                            position = 'top-center',
                            icon = 'hand'
                        })
                    end

                    if IsControlJustPressed(0, 51) then
                        lib.notify({
                            description = "Hello, World!"
                        })
                    end
                end
            else
                local isOpen, currentText = lib.isTextUIOpen()
                if isOpen and currentText == v.uiText then
                    lib.hideTextUI()
                end
            end
        end
    end
end
