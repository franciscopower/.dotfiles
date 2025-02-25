return {
  {
    "uga-rosa/ccc.nvim",
    config = function()
      local ccc = require("ccc")

      ccc.setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })

      vim.keymap.set("n", "<leader>pc", "<cmd>CccPick<CR>", { noremap = true, silent = true, desc="Pick color"})

      local test_color = "#ffef00"
    end,
  },
}
