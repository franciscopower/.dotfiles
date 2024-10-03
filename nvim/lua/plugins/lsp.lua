return {

  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    { 'nvim-telescope/telescope.nvim' },
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    {
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
  },
  config = function()

    require("luasnip.loaders.from_vscode").lazy_load()

    -- lsp configs
    local lsp = require("lsp-zero")
    lsp.preset("recommended")
    lsp.ensure_installed({
      "lua_ls",
      "eslint",
      "ts_ls",
      "angularls",
      "pyright",
      "html",
      "cssls",
      "clangd"
    })
    -- Fix Undefined global 'vim'
    lsp.nvim_workspace()

    -- cmp configs
    local cmp = require('cmp')
    local cmp_select = {behavior = cmp.SelectBehavior.Select}
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
    })
    cmp_mappings['<S-Tab>'] = nil
    lsp.setup_nvim_cmp({
      mapping = cmp_mappings
    })

    lsp.set_preferences({
      suggest_lsp_servers = false,
      sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
      }
    })

    -- keybindings
    lsp.on_attach(function(client, bufnr)

      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        {buffer = bufnr, remap = false, desc = 'Goto definition'})
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
        {buffer = bufnr, remap = false, desc = 'Show hover definition'})
      -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
        {buffer = bufnr, remap = false, desc = 'View diagnostic'})
      vim.keymap.set("n", "ge", function() vim.diagnostic.goto_next() end,
        {buffer = bufnr, remap = false, desc = 'Goto next error'})
      vim.keymap.set("n", "gE", function() vim.diagnostic.goto_prev() end,
        {buffer = bufnr, remap = false, desc = 'Goto prev error'})
      vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end,
        {buffer = bufnr, remap = false, desc = 'Code actions'})
      vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end,
        {buffer = bufnr, remap = false, desc = 'View references'})
      vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end,
        {buffer = bufnr, remap = false, desc = 'Rename'})
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
        {buffer = bufnr, remap = false, desc = 'Signature help'})
    end)

    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true
    })

  end
}
