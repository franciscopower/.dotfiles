return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,
      {desc = 'Add to Harpoon'})
		vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      {desc = 'Open Harpoon'})

		vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end,
      {desc = 'Harpoon - file 1'})
		vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end,
      {desc = 'Harpoon - file 2'})
		vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end,
      {desc = 'Harpoon - file 3'})
		vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end,
      {desc = 'Harpoon - file 4'})

		-- Toggle previous & next buffers stored within Harpoon list
		-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
		-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
	end,
}
