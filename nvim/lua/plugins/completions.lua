return {
  {
    'saghen/blink.cmp',
    dependencies = {
      -- { 'rafamadriz/friendly-snippets' },
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      snippets = { preset = 'luasnip' },
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      keymap = { preset = 'super-tab' },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          window = { border = "rounded" },
        },
        menu = {
          border = "rounded",
          winhighlight =
          "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    dependencies = {
      { 'rafamadriz/friendly-snippets' },
    },
    config = function ()
      require('luasnip').filetype_extend("htmlangular", { "html" })
      require('luasnip.loaders.from_vscode').lazy_load()
    end
  },
}
