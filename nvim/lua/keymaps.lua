-- CTRL+s to save in normal or input mode
vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "Save buffer" })

-- Close window
vim.keymap.set({ "n" }, "<leader>wc", "<cmd>q<CR>", { desc = "Window close" })

-- Quickfix list
vim.keymap.set("n", "<leader>qn", "<cmd>cnext<CR>", { desc = "Quickfix next" })
vim.keymap.set("n", "<leader>qp", "<cmd>cprev<CR>", { desc = "Quickfix prev" })
vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Quickfix open" })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Quickfix close" })

-- increment/decrement number under cursor
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })

-- close buffer
vim.keymap.set("n", "<leader>bc", "<cmd>bdelete<CR>", { desc = "Buffer close" })
-- switch between buffers
vim.keymap.set("n", "<Leader>bh", "<cmd>bprevious<CR>", { desc = "Buffer previous" })
vim.keymap.set("n", "<Leader>bl", "<cmd>bnext<CR>", { desc = "Buffer next" })

-- Split panes
vim.keymap.set("n", "<Leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<Leader>wh", "<cmd>split<CR>", { desc = "Horizontal split" })
-- switch between pane
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch to left pane" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch to bottom pane" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch to top pane" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch to right pane" })

-- resize panes
vim.keymap.set("n", "<C-A-h>", "<cmd>vertical resize -5<CR>", { desc = "Resize pane left (shrink)" })
vim.keymap.set("n", "<C-A-l>", "<cmd>vertical resize +5<CR>", { desc = "Resize pane right (grow)" })
vim.keymap.set("n", "<C-A-j>", "<cmd>horizontal resize -5<CR>", { desc = "Resize pane down (shrink)" })
vim.keymap.set("n", "<C-A-k>", "<cmd>horizontal resize +5<CR>", { desc = "Resize pane up (grow)" })

-- Tabs
vim.keymap.set("n", "<leader>th", "<cmd>tabprevious<CR>", { desc = "Tab previous" })
vim.keymap.set("n", "<leader>tl", "<cmd>tabnext<CR>", { desc = "Tab next" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Tab close" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Tab new" })
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "Tab only" })

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
vim.keymap.set("i", "<C-v>", '<ESC>"+pa')

-- duplicate and comment line
vim.keymap.set("n", "<leader>cc", "yypgcck^", { desc = "Duplicate and comment line", remap = true, silent = true })
vim.keymap.set("v", "<leader>cc", "yPgvgc", { desc = "Duplicate and comment selection", remap = true, silent = true })

-- Navigate to start and end of line
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- replace all occurences of the selected block
vim.keymap.set("v", "<leader>s", '"hy:%s/<C-r>h//g<left><left>', { desc = "substitute selected block" })
vim.keymap.set("v", "/", '"hy/<C-r>h', { desc = "search selected block" })
