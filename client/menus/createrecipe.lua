RegisterNetEvent('alt_crafting:createCraft')
AddEventHandler('alt_crafting:createCraft', function(itemsTable)

    local craftItem = {}
    local craftSettings = {}

    -- Define all initial options in a single table
    local options = {
        {type = 'select', label = locale('recipe_item_name'), options = itemsTable, searchable = true, required = true},
        {type = 'number', label = locale('recipe_craft_time'), required = true, min = 1},
        {type = 'number', label = locale('recipe_craft_qty'), required = true, default = 1},
        {type = 'slider', label = locale('recipe_ingredients_qty'), default = 1, min = 1, max = Config.MaxIngredientList, required = true},
        {type = 'number', label = locale('recipe_craft_perfect_qty'), default = 0, description = locale('recipe_perfect_desc')},
        {type = 'checkbox', label = locale('recipe_craft_durability'), checked = false},
        {type = 'select', label = locale('recipe_category'), options = Config.Categories, searchable = true, required = true},
    }

    -- Display input dialog for initial options
    local settingCraft = lib.inputDialog(locale('recipe_header'), options)
    if not settingCraft then return end

    -- Extract values from initial options
    local itemName, craftTime, craftQty, ingredientsQty, perfectQty, craftDurability, recipeCategory = table.unpack(settingCraft)

    -- Print selected values for verification
    print(string.format("Item to craft: ^2%s^7 | Time to craft: ^2%d seconds^7 | Quantity to get: x^2%d^7 | Required Items: ^2%d^7 | Perfect craft reward: x^2%d",
        itemName, craftTime, craftQty, ingredientsQty, perfectQty))

    -- Assign values to craftItem
    craftItem[itemName] = {
        label = getLabelFromData(itemsTable, itemName),
        time = craftTime,
        qty = craftQty,
        perfectQty = math.max(perfectQty, craftQty),
        category = recipeCategory
    }

    -- Handle durability if enabled
    if craftDurability then
        local durabilitySettings = getDurabilitySettings()
        if not durabilitySettings then return end
        craftItem[itemName].durability = durabilitySettings
    end

    -- Create options for ingredients
    local optionsIngredients = createIngredientsOptions(itemsTable, ingredientsQty)
    if not optionsIngredients then return end

    -- Display input dialog for ingredients options
    local settingIngredients = lib.inputDialog(locale('recipe_ingredients'), optionsIngredients)
    if not settingIngredients then return end

    -- Process selected ingredients
    local ingredients = processIngredients(itemsTable, settingIngredients)

    -- Assign ingredients to craftItem
    craftItem[itemName].ingredients = ingredients

    TriggerServerEvent('alt_crafting:createItem', craftItem)
end)

-- Function to handle durability settings
function getDurabilitySettings()
    local durabilitySettings = lib.inputDialog(locale('recipe_durability'), {
        {type ='slider', label = locale('recipe_min_durability'), min = 0, max = 100, default = 0},
        {type ='slider', label = locale('recipe_max_durability'), min = 0, max = 100, default = 100}
    })

    -- Check and swap values if maxDurability is less than minDurability
    if durabilitySettings and durabilitySettings[1] > durabilitySettings[2] then
        local temp = durabilitySettings[1]
        durabilitySettings[1] = durabilitySettings[2]
        durabilitySettings[2] = temp
    end

    return durabilitySettings
end

-- Function to create ingredients options
function createIngredientsOptions(itemsTable, ingredientsQty)
    local options = {}
    for i = 1, tonumber(ingredientsQty) do
        table.insert(options, {type = "select", label = string.format("Item %d", i), options = itemsTable, required = true, searchable = true})
        table.insert(options, {type ='slider', label = string.format(locale('recipe_ingredient_min_requiredqty'), i), min = 1, max = Config.MaxIngredientQty, default = 1})
        table.insert(options, {type ='slider', label = string.format(locale('recipe_ingredient_max_requiredqty'), i), min = 1, max = Config.MaxIngredientQty, default = 1})
    end
    return options
end

-- Function to process selected ingredients
function processIngredients(itemsTable, settingIngredients)
    local ingredients = {}
    for i = 1, #settingIngredients, 3 do
        local ingredientName = settingIngredients[i]
        local minQty = settingIngredients[i + 1]
        local maxQty = settingIngredients[i + 2]

        -- Check and swap values if maxQty is less than minQty
        if maxQty < minQty then
            minQty, maxQty = maxQty, minQty
        end

        local perfectQty = math.floor((minQty + maxQty) / 2)
        ingredients[ingredientName] = {minQty = minQty, maxQty = maxQty, perfectQty = perfectQty}
    end
    return ingredients
end
