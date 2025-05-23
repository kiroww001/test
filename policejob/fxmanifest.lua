fx_version 'adamant'
game 'gta5'
lua54 'yes'

escrow_ignore {
    'config.lua',
	"lib/RMenu.lua",
	"lib/menu/RageUI.lua",
	"lib/menu/Menu.lua",
	"lib/menu/MenuController.lua",
	"lib/components/*.lua",
	"lib/menu/elements/*.lua",
	"lib/menu/items/*.lua",
	"lib/menu/panels/*.lua",
	"lib/menu/panels/*.lua",
	"lib/menu/windows/*.lua",
	"server.lua",
	"client.lua"
}

shared_script 'config.lua'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	"server.lua",
	"config.lua"
}

client_scripts {
	'@es_extended/locale.lua',
	"lib/RMenu.lua",
	"lib/menu/RageUI.lua",
	"lib/menu/Menu.lua",
	"lib/menu/MenuController.lua",
	"lib/components/*.lua",
	"lib/menu/elements/*.lua",
	"lib/menu/items/*.lua",
	"lib/menu/panels/*.lua",
	"lib/menu/panels/*.lua",
	"lib/menu/windows/*.lua",
	"client.lua",
	"config.lua"
}
ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/banner.png'  
}





dependencies {'es_extended'}
