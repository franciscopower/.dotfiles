vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- general options
vim.opt.swapfile = false -- disable swap files
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Search
vim.opt.hlsearch = false
vim.o.incsearch = true  -- starts searching as soon as typing, without enter needed
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true  -- case insentive unless capitals used in searcher

-- Folds
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldenable = false

--
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#d8bd92" })


--- Keymaps

-- CTRL+s to save in normal or input mode
vim.keymap.set({ "n", "i" }, "<C-s>", function()
  vim.cmd("w")
end, { desc = "Save buffer" })
-- CTRL+w to quit
vim.keymap.set({ "n" }, "<leader>wc", function()
  vim.cmd("q")
end, { desc = "Window close" })

-- close buffer
vim.keymap.set("n", "<leader>bc", function()
  vim.cmd("bdelete")
end, { desc = "Buffer close" })
-- switch between buffers
vim.keymap.set("n", "<Leader>bh", function()
  vim.cmd("bprevious")
end, { desc = "Buffer previous" })
vim.keymap.set("n", "<Leader>bl", function()
  vim.cmd("bnext")
end, { desc = "Buffer next" })

-- Split panes
vim.keymap.set("n", "<Leader>wv", function()
  vim.cmd("vsplit")
end, { desc = "Vertical split" })
vim.keymap.set("n", "<Leader>wh", function()
  vim.cmd("split")
end, { desc = "Horizontal split" })
-- switch between pane
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch to left pane" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch to bottom pane" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch to top pane" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch to right pane" })

-- resize panes
vim.keymap.set("n", "<C-A-h>", function()
  vim.cmd("vertical resize -5")
end, { desc = "Resize pane larger" })
vim.keymap.set("n", "<C-A-l>", function()
  vim.cmd("vertical resize +5")
end, { desc = "Resize pane larger" })
vim.keymap.set("n", "<C-A-j>", function()
  vim.cmd("horizontal resize -5")
end, { desc = "Resize pane larger" })
vim.keymap.set("n", "<C-A-k>", function()
  vim.cmd("horizontal resize +5")
end, { desc = "Resize pane larger" })

-- swtich between tabs
vim.keymap.set("n", "<leader>th", function()
  vim.cmd("tabprevious")
end, { desc = "Tab previous" })
vim.keymap.set("n", "<leader>tl", function()
  vim.cmd("tabnext")
end, { desc = "Tab next" })
-- close tab
vim.keymap.set("n", "<leader>tc", function()
  vim.cmd("tabclose")
end, { desc = "Tab close" })
-- new tab
vim.keymap.set("n", "<leader>tn", function()
  vim.cmd("tabnew")
end, { desc = "Tab new" })

-- keep cursor in the middle with certain moves
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without yanking
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank into system clipboard
vim.keymap.set({ "n", "v" }, "<C-c>", [["+y]])

-- paste from system clipboard
vim.keymap.set({ "n", "v" }, "<C-v>", [["+p]])
vim.keymap.set("i", "<C-v>", '<ESC>"+pi')

-- Navigate to start and end of line
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- replace all occurences of the selected block
vim.keymap.set("v", "<leader>s", "\"hy:%s/<C-r>h//g<left><left>", {desc = "substitute selected block"})
vim.keymap.set("v", "<leader>/", "\"hy/<C-r>h", {desc = "search selected block"})
