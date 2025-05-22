return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {},
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts_extend = { "sources.default" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()

			require("blink.cmp").setup({
				keymap = { preset = "super-tab" },
				completion = {
					documentation = {
						auto_show = true,
						auto_show_delay_ms = 500,
						window = { border = "rounded" },
					},
					menu = {
						border = "rounded",
						winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
					},
				},
			})
		end,
	},
}
