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

				--python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.pylint,

				-- cpp
				null_ls.builtins.formatting.clang_format,

        -- xml
        null_ls.builtins.formatting.xmlformatter,

        -- go
        null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.diagnostics.staticcheck,
			},
		})

		vim.keymap.set("n", "<leader>n", vim.lsp.buf.format, { desc = "Format buffer" })
	end,
}
