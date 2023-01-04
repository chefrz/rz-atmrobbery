fx_version 'adamant'
lua54 'yes'
game 'gta5'

client_scripts {
    "client.lua"
}

server_scripts { 
    "server.lua"
}

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
}

escrow_ignore {
    'client.lua',
    'server.lua',
    'config.lua',
    'locales/en.lua',
    'locales/*.lua',
}