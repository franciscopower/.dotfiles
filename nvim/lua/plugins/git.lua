return {
  {
    "tpope/vim-fugitive",
  },
  {
    "sindrets/diffview.nvim",
    config = function ()
      vim.keymap.set('n', '<leader>gdo', ":DiffviewOpen<CR>", {})
      vim.keymap.set('n', '<leader>gdc', ":DiffviewClose<CR>", {})
      vim.keymap.set('n', '<leader>gdh', ":DiffviewClose<CR>", {})
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gs = require('gitsigns')
      gs.setup()

      vim.keymap.set('n', '<leader>gp', gs.preview_hunk, {})
      vim.keymap.set('n', '<leader>gs', gs.stage_hunk, {})
      vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk, {})
      vim.keymap.set('n', '<leader>gr', gs.reset_hunk, {})
      vim.keymap.set('n', '<leader>gB', gs.toggle_current_line_blame, {})
      vim.keymap.set('n', '<leader>gdt', gs.diffthis, {})
    end
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

      vim.keymap.set("n", "<leader>gg", neogit.open, { silent = true, noremap = true })
      vim.keymap.set("n", "<leader>gb", function() vim.cmd("Telescope git_branches") end,
        { silent = true, noremap = true })
    end
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  }
}
