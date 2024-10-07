vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set nohlsearch")
vim.cmd("set smartcase")
vim.cmd("set splitright")


-- CTRL+s to save in normal or input mode
vim.keymap.set({"n", "i"}, "<C-s>", function() vim.cmd("w") end, {desc = 'Save buffer'})
-- CTRL+w to quit
vim.keymap.set({"n"}, "<leader>wc", function() vim.cmd("q") end, {desc = 'Window close'})

-- close buffer
vim.keymap.set("n", "<leader>bc", function() vim.cmd("bdelete") end, {desc = 'Buffer close'})
-- switch between buffers
vim.keymap.set("n", "<Leader>bh", function() vim.cmd("bprevious") end, {desc = 'Buffer previous'})
vim.keymap.set("n", "<Leader>bl", function() vim.cmd("bnext") end, {desc = 'Buffer next'})

-- Split panes
vim.keymap.set("n", "<Leader>vs", function() vim.cmd("vsplit") end, {desc = "Vertical split"})
-- switch between pane
vim.keymap.set("n", "<C-h>", "<C-w>h", {desc = 'Switch to left pane'})
vim.keymap.set("n", "<C-j>", "<C-w>j", {desc = 'Switch to bottom pane'})
vim.keymap.set("n", "<C-k>", "<C-w>k", {desc = 'Switch to top pane'})
vim.keymap.set("n", "<C-l>", "<C-w>l", {desc = 'Switch to right pane'})

-- resize panes
vim.keymap.set("n", "<C-A-h>", function() vim.cmd("vertical resize -5") end, {desc = 'Resize pane larger'})
vim.keymap.set("n", "<C-A-l>", function() vim.cmd("vertical resize +5") end, {desc = 'Resize pane larger'})
vim.keymap.set("n", "<C-A-j>", function() vim.cmd("horizontal resize -5") end, {desc = 'Resize pane larger'})
vim.keymap.set("n", "<C-A-k>", function() vim.cmd("horizontal resize +5") end, {desc = 'Resize pane larger'})

-- swtich between tabs
vim.keymap.set("n", "<leader>th", function() vim.cmd("tabprevious") end, {desc = 'Tab previous'})
vim.keymap.set("n", "<leader>tl", function() vim.cmd("tabnext") end, {desc = 'Tab next'})
-- close tab
vim.keymap.set("n", "<leader>tc", function() vim.cmd("tabclose") end, {desc = 'Tab close'})
-- new tab
vim.keymap.set("n", "<leader>tn", function() vim.cmd("tabnew") end, {desc = 'Tab new'})

-- move highlited lines together
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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
vim.keymap.set("i", "<C-v>", "<ESC>\"+pi")

-- Navigate to start and end of line
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

