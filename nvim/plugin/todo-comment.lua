vim.pack.add({
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
})

require("todo-comments").setup()

vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { noremap = true, silent = true, desc = "Find TODOs" })
vim.keymap.set("n", "<leader>vt", "<cmd>TodoTrouble<cr>", { noremap = true, silent = true, desc = "View TODOs" })
