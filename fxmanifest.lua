game 'common'
fx_version 'adamant'

version '1.0.0'
author 'reveldev on discord'
description 'Made with a lot of love for QBCORE Community'

shared_script {
    'config.lua',
}

server_script {'server.lua'}

files {
	'*.css',
    '*.png'
}

chat_theme 'qbcore' {
    styleSheet = 'style.css',
    msgTemplates = {
        default = '<div class="container-msg"><span class="heading"><span class="plname" style="background-color: rgb(220 20 60);">{0}</span><div class="qblg"></div></span><span class="second-text">{1}</span></div>'
    }
}
