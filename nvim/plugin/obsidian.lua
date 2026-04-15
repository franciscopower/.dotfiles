local obsidianVaultPath = vim.fn.expand("~") .. "/OneDrive - Bosch Group/Notes"

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
	pattern = {
		obsidianVaultPath .. "/*.md",
		obsidianVaultPath .. "/*.md",
	},
	callback = function()
		vim.pack.add({
			"https://github.com/epwalsh/obsidian.nvim",
			"https://github.com/nvim-lua/plenary.nvim",
		})

		require("obsidian").setup({ workspaces = { { name = "personal", path = obsidianVaultPath } } })
		vim.opt.conceallevel = 2
	end,
})
