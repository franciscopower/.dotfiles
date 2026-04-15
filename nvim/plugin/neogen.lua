vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.pack.add({
			"https://github.com/danymat/neogen",
			"https://github.com/nvim-treesitter/nvim-treesitter",
			"https://github.com/L3MON4D3/LuaSnip",
		})

		local neogen = require("neogen")

		neogen.setup({
			snippet_engine = "luasnip",
		})

		vim.keymap.set("n", "<leader>cf", function()
			neogen.generate({ type = "func" })
		end, { desc = "comment function" })

		vim.keymap.set("n", "<leader>ct", function()
			neogen.generate({ type = "type" })
		end, { desc = "comment type" })
	end,
	once = true,
})
