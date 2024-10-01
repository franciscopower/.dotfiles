return {
  {
    "tpope/vim-fugitive",
    config = function ()
      vim.keymap.set("n", "<leader>gB", function() vim.cmd("Git blame") end, { silent = true, noremap = true }) end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gs = require('gitsigns')
      gs.setup()

      vim.keymap.set('n', '<leader>hp', gs.preview_hunk, {})
      vim.keymap.set('n', '<leader>hs', gs.stage_hunk, {})
      vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, {})
      vim.keymap.set('n', '<leader>hr', gs.reset_hunk, {})
      vim.keymap.set('n', '<leader>hb', gs.toggle_current_line_blame, {})
      vim.keymap.set('n', '<leader>hd', gs.diffthis, {})
    end
  },
  {
    "sindrets/diffview.nvim",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local neogit = require('neogit')
      neogit.setup()

      vim.keymap.set("n", "<leader>gs", neogit.open, { silent = true, noremap = true })
      vim.keymap.set("n", "<leader>gc", function() vim.cmd("Neogit commit") end, { silent = true, noremap = true })
      vim.keymap.set("n", "<leader>gp", function() vim.cmd("Neogit pull") end, { silent = true, noremap = true })
      vim.keymap.set("n", "<leader>gP", function() vim.cmd("Neogit push") end, { silent = true, noremap = true })
      vim.keymap.set("n", "<leader>gb", function() vim.cmd("Telescope git_branches") end, { silent = true, noremap = true })
    end
  }
}
