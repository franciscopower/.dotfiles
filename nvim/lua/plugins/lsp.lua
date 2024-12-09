return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Autocompletion
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    -- for mason to play nice with LSP config
    require("mason-lspconfig").setup()
    -- vscode snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    local lspconfig = require("lspconfig")

    vim.opt.signcolumn = 'yes'

    -- Add cmp_nvim_lsp capabilities settings to lspconfig
    -- This should be executed before you configure any language server
    local lspconfig_defaults = require("lspconfig").util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      "force",
      lspconfig_defaults.capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    --------------------
    -- setup all LSPs --
    --------------------
    lspconfig.lua_ls.setup({})
    lspconfig.eslint.setup({})
    lspconfig.ts_ls.setup({})
    lspconfig.angularls.setup({})
    lspconfig.pyright.setup({})
    lspconfig.html.setup({})
    lspconfig.cssls.setup({})
    lspconfig.clangd.setup({})

    ----------------------
    -- setup completion --
    ----------------------
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
      }, {
        { name = "buffer" },
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<TAB>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
    })

    -----------------------
    -- setup keybindings --
    -----------------------
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
        end, { buffer = bufnr, remap = false, desc = "Goto definition" })
        vim.keymap.set("n", "gD", function()
          vim.lsp.buf.declaration()
        end, { buffer = bufnr, remap = false, desc = "Goto declaration" })
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, { buffer = bufnr, remap = false, desc = "Show hover definition" })
        vim.keymap.set("n", "ge", function()
          vim.diagnostic.goto_next()
        end, { buffer = bufnr, remap = false, desc = "Goto next error" })
        vim.keymap.set("n", "gE", function()
          vim.diagnostic.goto_prev()
        end, { buffer = bufnr, remap = false, desc = "Goto prev error" })
        vim.keymap.set("n", "<leader>ga", function()
          vim.lsp.buf.code_action()
        end, { buffer = bufnr, remap = false, desc = "Code actions" })
        vim.keymap.set("n", "<leader>rn", function()
          vim.lsp.buf.rename()
        end, { buffer = bufnr, remap = false, desc = "Rename" })
        vim.keymap.set("n", "<leader>vd", function()
          vim.diagnostic.open_float()
        end, { buffer = bufnr, remap = false, desc = "View diagnostics" })
      end,
    })

    --------------------------
    -- other configurations --
    --------------------------
    vim.diagnostic.config({
      underline = true,
      virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN },
      },
    })
  end,
}
