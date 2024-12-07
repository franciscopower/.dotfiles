return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {

				--lua
				null_ls.builtins.formatting.stylua,

				--web
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.djlint,

				--python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.pylint,

				-- cpp
				null_ls.builtins.formatting.clang_format,
			},
		})

		vim.keymap.set("n", "<leader>n", vim.lsp.buf.format, { desc = "Format buffer" })
	end,
}
