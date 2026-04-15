vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/lewis6991/spaceless.nvim",
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		python = { "black", "isort" },
		xml = { "xmlformatter" },
		go = { "gofumpt", "goimports", "golines" },
		html = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		htmlangular = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		svelte = { "prettier" },
		markdown = { "prettier" },
	},
	formatters = {
		prettier = {
			prepend_args = {
				"--config-precedence",
				"prefer-file",
			},
		},
	},
})

-- Auto-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf, lsp_fallback = true })
	end,
})

vim.keymap.set("n", "<leader>cf", require("conform").format, { desc = "Code format" })
