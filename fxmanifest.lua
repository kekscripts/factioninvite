fx_version 'cerulean'
game 'gta5'

author 'kekscripts'
description 'kekscripts faction invite'
version '1.0.0'

client_scripts {
    'client.lua'
}

server_scripts {
    'config.lua',
    'server.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/img/handshake.png',
}

exports {
    "factioninvitenearest"
}