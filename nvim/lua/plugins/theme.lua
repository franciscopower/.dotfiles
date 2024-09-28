return 
  {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
        vim.cmd.colorscheme "catppuccin"
      end
    },
    {
      "xiyaowong/transparent.nvim",
      lazy = false, -- NOTE: NO NEED to Lazy load
      config = function()
        local transparent = require("transparent")
        -- transparent.setup({
        -- extra_groups = {
        --     "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
        --   },
        -- })
        transparent.clear_prefix('NeoTree')
        transparent.clear_prefix('lualine')
      end
    }
  }
