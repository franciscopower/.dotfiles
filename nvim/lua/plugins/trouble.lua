return {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>ve",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "View Errors / Warnings / Info",
    },
    {
      "<leader>vl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "View LSP Definitions / references / ... ",
    },
  },
}
