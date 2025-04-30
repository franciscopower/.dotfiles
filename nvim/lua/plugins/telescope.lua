return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({ }),
          },
        },
      })
      require("telescope").load_extension("ui-select")

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find git files" })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
      vim.keymap.set(
        "n",
        "<leader>fs",
        builtin.current_buffer_fuzzy_find,
        { desc = "Telescope file fuzzy finder" }
      )
      vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Telescope registers" })
      vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Telescope quickfix" })
      vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Telescope LPS references" })

      vim.keymap.set("n", "<leader>fc", function()
        builtin.find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end, { desc = "Telescope nvim config" })
    end,
  },
}
