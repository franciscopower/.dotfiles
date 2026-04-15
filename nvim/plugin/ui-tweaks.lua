vim.schedule(function()
	vim.pack.add({
		"https://github.com/sphamba/smear-cursor.nvim",
		"https://github.com/nanozuki/tabby.nvim",
	})

	require("smear_cursor").setup({
		stiffness = 0.8, -- 0.6      [0, 1]
		trailing_stiffness = 0.6, -- 0.45     [0, 1]
		stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
		trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
		damping = 0.95, -- 0.85     [0, 1]
		damping_insert_mode = 0.95, -- 0.9      [0, 1]
		distance_stop_animating = 0.5, -- 0.1      > 0
	})

	require("tabby").setup()
	vim.keymap.set("n", "<leader>tj", "<cmd>Tabby jump_to_tab<CR>", { desc = "Jump to tab" })
end)
