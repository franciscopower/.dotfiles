vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set nohlsearch")

-- CTRL+s to save
vim.keymap.set("n", "<C-s>", function ()
  vim.cmd("w")
end)

-- CTRL+w to close pane
vim.keymap.set("n", "<C-w>", function ()
  vim.cmd("q")
end)

-- close buffer
vim.keymap.set("n", "<Leader>q", function ()
  vim.cmd("bdelete")
end)
-- switch between buffers
vim.keymap.set("n", "<Leader>h", function ()
  vim.cmd("bprevious")
end)
vim.keymap.set("n", "<Leader>l", function ()
  vim.cmd("bnext")
end)

-- Split panes
vim.keymap.set("n", "<Leader>vs", function ()
  vim.cmd("vsplit")
end)
-- switch between panes
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
-- resize panes
vim.keymap.set("n", "<C-S-Left>", function ()
  vim.cmd("vertical resize -5")
end)
vim.keymap.set("n", "<C-S-Right>", function ()
  vim.cmd("vertical resize +5")
end)

-- swtich between tabs
vim.keymap.set("n", "<leader>th", function()
  vim.cmd("tabprevious")
end)
vim.keymap.set("n", "<leader>tl", function()
  vim.cmd("tabnext")
end)

-- move highlited lines together
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle with certain moves
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- do not copy when pasting over something
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank into system clipboard
vim.keymap.set({ "n", "v" }, "<C-c>", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- paste from system clipboard
vim.keymap.set({"n", "v"}, "<C-v>", [["+p]])
vim.keymap.set("i", "<C-v>", "<ESC>\"+pi")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)