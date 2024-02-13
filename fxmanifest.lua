fx_version 'adamant'
lua54 'yes'
game 'gta5'

client_scripts {
    "client/main.lua"
}

server_scripts { 
    "server/main.lua"
}

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
}