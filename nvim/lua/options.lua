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
vim.opt.splitbelow = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.shadafile = "NONE"
vim.opt.iskeyword:append("-")
vim.opt.mouse = "a"

vim.opt.signcolumn = "yes"

-- Search
vim.opt.hlsearch = false
vim.o.incsearch = true -- starts searching as soon as typing, without enter needed
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true -- case insentive unless capitals used in searcher

-- Folds
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldenable = false

-- Borders
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#d8bd92" })
vim.o.winborder = "rounded"

-- Terminal
vim.o.shell = "powershell.exe -nologo"
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
