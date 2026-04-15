vim.schedule(function()
	vim.pack.add({
		"https://github.com/uga-rosa/ccc.nvim",
	})

	require("ccc").setup({
		highlighter = {
			auto_enable = true,
			lsp = true,
		},
	})

	vim.keymap.set("n", "<leader>pc", "<cmd>CccPick<CR>", { noremap = true, silent = true, desc = "Pick color" })
end)
