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
<<<<<<< HEAD
      "tailwindcss",
=======
      "powershell_es",
      "nginx_language_server",
      "docker_compose_language_service",
      "dockerls",
      "gopls",
>>>>>>> 4260e530e7eaf8665880dae20155f96932833614
      -- formatters
      "stylua",
      "gofumpt",
      "goimports",
      "golines",
      "prettier",
      "black",
      "isort",
      "clang_format",
      "xmlformatter",
      -- linting
      "pylint",
      "staticcheck",
      -- DAP
      "codelldb",
      "delve", -- Golang
      "debugpy"
    },
  },
}
