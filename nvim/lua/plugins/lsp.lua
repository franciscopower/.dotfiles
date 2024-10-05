return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "angularls",
          "clangd",
          "cssls",
          "eslint",
          "html",
          "lua_ls",
          "pyright",
          "ts_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- config different lsp servers --
      lspconfig.angularls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      -- LSP keymaps --
      vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
      end, { buffer = bufnr, remap = false, desc = "Goto definition" })
      vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
      end, { buffer = bufnr, remap = false, desc = "Show hover definition" })
      vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.open_float()
      end, { buffer = bufnr, remap = false, desc = "View diagnostic" })
      vim.keymap.set("n", "ge", function()
        vim.diagnostic.goto_next()
      end, { buffer = bufnr, remap = false, desc = "Goto next error" })
      vim.keymap.set("n", "gE", function()
        vim.diagnostic.goto_prev()
      end, { buffer = bufnr, remap = false, desc = "Goto prev error" })
      vim.keymap.set("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
      end, { buffer = bufnr, remap = false, desc = "Code actions" })
      vim.keymap.set("n", "<leader>rr", function()
        vim.lsp.buf.references()
      end, { buffer = bufnr, remap = false, desc = "View references" })
      vim.keymap.set("n", "<leader>rn", function()
        vim.lsp.buf.rename()
      end, { buffer = bufnr, remap = false, desc = "Rename" })
      vim.keymap.set("i", "<C-h>", function()
        vim.lsp.buf.signature_help()
      end, { buffer = bufnr, remap = false, desc = "Signature help" })
    end,
  },
}
