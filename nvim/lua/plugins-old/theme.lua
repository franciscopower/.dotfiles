return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		lazy = false, -- NO NEED to Lazy load
		config = function()
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
		end,
	},
}
