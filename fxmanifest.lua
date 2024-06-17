fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'ENT510'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'core.lua'
}

client_scripts {
    'modules/client/camera.lua',
    'modules/client/cl_main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'modules/server/function.lua',
    'modules/server/sv_main.lua',
}
ui_page 'nui/index.html'

files {
    "nui/index.html",
    "nui/styles.css",
    "nui/script.js",
    'utils/utils.lua',
}
