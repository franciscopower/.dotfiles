vim.schedule(function()
	vim.pack.add({
		"https://github.com/rgroli/other.nvim",
	})

	require("other-nvim").setup({
		mappings = {
			"angular",
			"python",
			"rust",
		},
	})

	vim.keymap.set("n", "<leader>oo", "<cmd>Other<CR>", { desc = "Open other" })
	vim.keymap.set("n", "<leader>on", "<cmd>OtherTabNew<CR>", { desc = "Open other in new tab" })
	vim.keymap.set("n", "<leader>ov", "<cmd>OtherVSplit<CR>", { desc = "Open other in vsplit" })
	-- vim.keymap.set("n", "<leader>oc", "<cmd>OtherClear<CR>", { desc = 'Clear other' })

	-- Context specific bindings
	vim.keymap.set("n", "<leader>ot", "<cmd>Other test<CR>", { desc = "Open test file" })
	vim.keymap.set("n", "<leader>oc", "<cmd>Other component<CR>", { desc = "Open component file" })
	vim.keymap.set("n", "<leader>os", "<cmd>Other scss<CR>", { desc = "Open scss file" })
	vim.keymap.set("n", "<leader>oh", "<cmd>Other html<CR>", { desc = "Open html file" })
end)
