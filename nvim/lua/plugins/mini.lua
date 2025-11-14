return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.ai").setup()
      require("mini.indentscope").setup()
      require("mini.splitjoin").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require("mini.move").setup({
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = "<S-h>",
          right = "<S-l>",
          down = "<S-j>",
          up = "<S-k>",
          -- Move current line in Normal mode
          line_left = "",
          line_right = "",
          line_down = "",
          line_up = "",
        },
      })

      local minifiles = require("mini.files")
      minifiles.setup()
			vim.keymap.set("n", "<leader>vw", minifiles.open, { desc = "View Working directory (Mini Files)" })

 end,
  },
}
