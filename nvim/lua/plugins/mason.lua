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
      "powershell_es",
      "nginx_language_server",
      "docker_compose_language_service",
      "dockerls",
      -- formatters
      "stylua",
      "prettier",
      "black",
      "isort",
      "clang_format",
      "xmlformatter",
      -- linting
      "pylint",
      -- DAP
      "codelldb",
    },
  },
}
