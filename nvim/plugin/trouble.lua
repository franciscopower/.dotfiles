vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.pack.add({
			"https://github.com/folke/trouble.nvim",
		})
		require("trouble").setup()
		vim.keymap.set(
			"n",
			"<leader>ve",
			"<cmd>Trouble diagnostics toggle<cr>",
			{ desc = "View Errors / Warnings / Info" }
		)
		vim.keymap.set(
			"n",
			"<leader>vl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			{ desc = "View LSP Definitions / references / ... " }
		)
	end,
	once = true,
})
