return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, --lua

				null_ls.builtins.formatting.prettier, --web
				null_ls.builtins.diagnostics.eslint_d,

				null_ls.builtins.formatting.black, --python
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.pylint,

				-- null_ls.builtins.completion.spell,
				-- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
			},
		})

		vim.keymap.set("n", "<leader>pp", vim.lsp.buf.format, {})
	end,
}
