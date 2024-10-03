return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    {'nvim-telescope/telescope.nvim'},
  },
  config = function()
    require('neoclip').setup()
    vim.keymap.set('n', '<leader>fc', ":Telescope neoclip<CR>", { desc = 'Telescope clipboard'})
  end,
}
