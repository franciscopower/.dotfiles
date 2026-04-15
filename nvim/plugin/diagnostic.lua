vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.pack.add({
			"https://github.com/rachartier/tiny-inline-diagnostic.nvim",
		})
		require("tiny-inline-diagnostic").setup()

		vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
	end,
	once = true,
})
