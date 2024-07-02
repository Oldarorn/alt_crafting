fx_version 'cerulean'
game 'gta5'
version '0.0.1'
author 'Oldarorn'
description 'Altered Crafting is a FiveM resource designed to create crafting points, define crafting recipes with success rates, and trigger events upon success or failure. This project is public to encourage learning and invite other developers to contribute in the future.'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua'
}

client_scripts {
    'client/**/**.lua',
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/**/**.lua',
    'server/*.lua'
}

files {
    'locales/*.json'
}