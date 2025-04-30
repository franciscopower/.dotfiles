return {
  "williamboman/mason.nvim",
  run = function()
    pcall(vim.cmd, "MasonUpdate")
  end,
  opts = {
    ensure_installed = {
      -- lsp servers
      "lua_ls",
      "eslint",
      "ts_ls",
      "angularls",
      "pyright",
      "html",
      "cssls",
      "clangd",
      "svelte",
      "tailwindcss",
      -- formatters
      "stylua",
      "prettier",
      "black",
      "isort",
      "clang_format",
      -- linting
      "eslint_d",
      "pylint",
      -- DAP
      "codelldb",
    },
  },
}
