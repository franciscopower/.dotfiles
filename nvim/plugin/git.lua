vim.pack.add({
	"https://github.com/sindrets/diffview.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/NeogitOrg/neogit",
	"https://github.com/nvim-lua/plenary.nvim",
})

-- Diff view setup
vim.keymap.set("n", "<leader>gdo", ":DiffviewOpen<CR>", { desc = "Git - diffview open" })
vim.keymap.set("n", "<leader>gdc", ":DiffviewClose<CR>", { desc = "Git - diffview close" })
vim.keymap.set("n", "<leader>gdh", ":DiffviewFileHistory<CR>", { desc = "Git - diffview file history" })

-- Git Signs setup
local gs = require("gitsigns")
gs.setup()
vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { desc = "Git - preview hunk" })
vim.keymap.set("n", "<leader>gs", gs.stage_hunk, { desc = "Git - stage hunk" })
vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Git - unstage hunk" })
vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { desc = "Git - reset hunk" })
vim.keymap.set("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Git - toggle current line blame" })
vim.keymap.set("n", "<leader>gdt", gs.diffthis, { desc = "Git - diffview current file" })
vim.keymap.set("n", "<leader>gq", gs.setqflist, { desc = "Git - set quick-fix list" })
vim.keymap.set("n", "<leader>gQ", function()
	gs.setqflist("all")
end, { desc = "Git - set quick-fix list - ALL" })
vim.keymap.set("n", "<leader>gn", function()
	if vim.wo.diff then
		vim.cmd.normal({ "]c", bang = true })
	else
		gs.nav_hunk("next")
	end
end, { desc = "Git - go to next change" })
vim.keymap.set("n", "<leader>gN", function()
	if vim.wo.diff then
		vim.cmd.normal({ "]c", bang = true })
	else
		gs.nav_hunk("prev")
	end
end, { desc = "Git - go to prev change" })

-- NeoGit setup
local neogit = require("neogit")
neogit.setup({
	graph_style = "unicode",
	commit_editor = {
		staged_diff_split_kind = "vsplit",
	},
})

vim.keymap.set("n", "<leader>gg", neogit.open, { silent = true, noremap = true, desc = "Open NeoGit" })
vim.keymap.set("n", "<leader>gB", function()
	vim.cmd("Telescope git_branches")
end, { silent = true, noremap = true, desc = "Find git branches" })
