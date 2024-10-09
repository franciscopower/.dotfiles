return {

  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    -- require packages
    local lsp = require("lsp-zero")
    local cmp = require("cmp")
    require("luasnip.loaders.from_vscode").lazy_load()
    -- Fix Undefined global 'vim'
    lsp.nvim_workspace()

    -------------------
    --- lsp configs ---
    -------------------
    lsp.preset("recommended")

    lsp.set_preferences({
      suggest_lsp_servers = false,
      sign_icons = {
        error = " ",
        warn = " ",
        hint = "󰌵",
        info = " ",
      },
    })

    -------------------
    -- cmp configs ---
    -------------------
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    lsp.setup_nvim_cmp({
      mapping = lsp.defaults.cmp_mappings({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<S-Tab>"] = nil,
      }),
      snippet = {
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
      }, {
        { name = "buffer" },
      }),
    })

    ------------------
    -- keybindings ---
    ------------------
    lsp.on_attach(function(_, bufnr)
      vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
      end, { buffer = bufnr, remap = false, desc = "Goto definition" })
      vim.keymap.set("n", "gD", function()
        vim.lsp.buf.declaration()
      end, { buffer = bufnr, remap = false, desc = "Goto definition" })
      vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
      end, { buffer = bufnr, remap = false, desc = "Show hover definition" })
      -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
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
    end)

    -- run setup function
    lsp.setup()
    vim.diagnostic.config({
      underline = true,
      virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN },
      },
    })
  end,
}
