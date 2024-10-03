return {
  'rgroli/other.nvim',
  config = function ()
    require("other-nvim").setup({
      mappings = {
        "angular",
        "python",
        "rust",
      },
    })

    vim.api.nvim_set_keymap("n", "<leader>oo", "<cmd>:Other<CR>", { noremap = true, silent = true, desc = 'Open other' })
    vim.api.nvim_set_keymap("n", "<leader>on", "<cmd>:OtherTabNew<CR>", { noremap = true, silent = true, desc = 'Open other in new tab' })
    vim.api.nvim_set_keymap("n", "<leader>ov", "<cmd>:OtherVSplit<CR>", { noremap = true, silent = true, desc = 'Open other in vsplit' })
    -- vim.api.nvim_set_keymap("n", "<leader>oc", "<cmd>:OtherClear<CR>", { noremap = true, silent = true })

    -- Context specific bindings
    vim.api.nvim_set_keymap("n", "<leader>ot", "<cmd>:Other test<CR>", { noremap = true, silent = true, desc = 'Open test file' })
    vim.api.nvim_set_keymap("n", "<leader>oc", "<cmd>:Other component<CR>", { noremap = true, silent = true, desc = 'Open component file' })
    vim.api.nvim_set_keymap("n", "<leader>os", "<cmd>:Other scss<CR>", { noremap = true, silent = true, desc = 'Open scss file' })
    vim.api.nvim_set_keymap("n", "<leader>oh", "<cmd>:Other html<CR>", { noremap = true, silent = true, desc = 'Open html file' })

  end
}
