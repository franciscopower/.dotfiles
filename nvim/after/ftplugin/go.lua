vim.pack.add({
	"https://github.com/olexsmir/gopher.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

require("gopher").setup()

-- treesitter config
local ensureInstalled = {
	"go",
	"gomod",
}
local alreadyInstalled = require("nvim-treesitter.config").get_installed()
local parsersToInstall = vim.iter(ensureInstalled)
	:filter(function(parser)
		return not vim.tbl_contains(alreadyInstalled, parser)
	end)
	:totable()
require("nvim-treesitter").install(parsersToInstall)

vim.treesitter.start()
