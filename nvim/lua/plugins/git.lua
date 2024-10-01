return {
  {
    "tpope/vim-fugitive",
    config = function ()
      vim.keymap.set("n", "<leader>gB",
        function()
          vim.cmd("Git blame")
        end,
        { silent = true, noremap = true }
      )
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()

      vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', {})
    end
  },
  {
    "sindrets/diffview.nvim",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local neogit = require('neogit')
      neogit.setup()

      vim.keymap.set("n", "<leader>gs", neogit.open, { silent = true, noremap = true })
      vim.keymap.set("n", "<leader>gc",
        function()
          vim.cmd("Neogit commit")
        end,
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", "<leader>gp",
        function()
          vim.cmd("Neogit pull")
        end,
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", "<leader>gP",
        function()
          vim.cmd("Neogit push")
        end,
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", "<leader>gb",
        function()
          vim.cmd("Telescope git_branches")
        end,
        { silent = true, noremap = true }
      )
    end
  }
}
