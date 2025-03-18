return {
  {
    "uga-rosa/ccc.nvim",
    main = "ccc",
    init = function ()
      vim.keymap.set("n", "<leader>pc", "<cmd>CccPick<CR>", { noremap = true, silent = true, desc="Pick color"})
    end,
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
  },
}
