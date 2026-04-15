vim.pack.add({
	"https://github.com/AlexvZyl/nordic.nvim",
	"https://github.com/catppuccin/nvim",
	"https://github.com/xiyaowong/transparent.nvim",
})
require("nordic").load()

local transparent = require("transparent")
transparent.setup({
	extra_groups = {
		"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
		"TelescopeBorder",
		"MiniFilesBorder",
		"BlinkCmpMenuBorder",
	},
})
transparent.clear_prefix("NeoTree")
-- transparent.clear_prefix('lualine')
