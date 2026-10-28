-- NOTE: Ensure that the tree-sitter cli is installed and available in your PATH.
-- See: https://github.com/tree-sitter/tree-sitter/releases

local parsers = {
	"bash",
	"c",
	"css",
	"go",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"scss",
	"svelte",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

-- Install missing parsers and their queries
require("nvim-treesitter").install(parsers)

-- Enable Tree-sitter highlighting
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
