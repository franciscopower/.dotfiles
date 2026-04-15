vim.pack.add {
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range('1.0') },
  "https://github.com/rafamadriz/friendly-snippets",
  { src = "https://github.com/L3MON4D3/LuaSnip",  version = vim.version.range('2.0') },
}

require("blink.cmp").setup({
  snippets = { preset = "luasnip" },
  -- All presets have the following mappings:
  -- C-space: Open menu or open docs if already open
  -- C-n/C-p or Up/Down: Select next/previous item
  -- C-e: Hide menu
  -- C-k: Toggle signature help (if signature.enabled = true)
  keymap = { preset = "super-tab" },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = "mono",
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
      window = { border = "rounded" },
    },
    menu = {
      border = "rounded",
      winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

  fuzzy = { implementation = "prefer_rust_with_warning" },
})

-- opts_extend = { "sources.default" },

require("luasnip").filetype_extend("htmlangular", { "html" })
require("luasnip.loaders.from_vscode").lazy_load()
