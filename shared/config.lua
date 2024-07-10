ox_inventory = exports.ox_inventory
lib.locale()
ox_target = exports.ox_target

Config = {}

Config.Framework = 'esx' -- Only ESX atm
Config.Inventory = 'ox_inventory' -- Only ox_inventory atm

Config.MaxIngredientList = 10
Config.MaxIngredientQty = 100

Config.Categories = {
    {value = 'cooking', label = locale('cooking_cat'), icon = 'fa-burger'},
    {value = 'drinks', label = locale('drinks_cat'), icon = 'fa-martini-glass'},
    {value = 'misc', label = locale('misc_cat'), icon = 'fa-shuffle'},
}