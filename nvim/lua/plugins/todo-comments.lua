return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup()
		vim.keymap.set(
			"n",
			"<leader>ft",
			"<cmd>TodoTelescope<cr>",
			{ noremap = true, silent = true, desc = "Find TODOs" }
		)

		vim.keymap.set(
			"n",
			"<leader>ct",
			"<cmd>TodoTrouble<cr>",
			{ noremap = true, silent = true, desc = "Trouble List" }
		)
	end,
}
