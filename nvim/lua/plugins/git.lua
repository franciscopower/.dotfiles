return {
  {
    "sindrets/diffview.nvim",
    config = function()
      vim.keymap.set("n", "<leader>gdo", ":DiffviewOpen<CR>", { desc = "Git - diffview open" })
      vim.keymap.set("n", "<leader>gdc", ":DiffviewClose<CR>", { desc = "Git - diffview close" })
      vim.keymap.set("n", "<leader>gdh", ":DiffviewFileHistory<CR>", { desc = "Git - diffview file history" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gs = require("gitsigns")
      gs.setup()

      vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { desc = "Git - preview hunk" })
      vim.keymap.set("n", "<leader>gs", gs.stage_hunk, { desc = "Git - stage hunk" })
      vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Git - unstage hunk" })
      vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { desc = "Git - reset hunk" })
      vim.keymap.set(
        "n",
        "<leader>gb",
        gs.toggle_current_line_blame,
        { desc = "Git - toggle current line blame" }
      )
      vim.keymap.set("n", "<leader>gdt", gs.diffthis, { desc = "Git - diffview current file" })
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local neogit = require("neogit")
      neogit.setup({
        graph_style = "unicode",
        commit_editor = {
          staged_diff_split_kind = "vsplit",
        },
      })

      vim.keymap.set("n", "<leader>gg", neogit.open, { silent = true, noremap = true, desc = "Open NeoGit" })
      vim.keymap.set("n", "<leader>gB", function()
        vim.cmd("Telescope git_branches")
      end, { silent = true, noremap = true, desc = "Find git branches" })
    end,
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
      { "<leader>gl", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
    },
  },
}
