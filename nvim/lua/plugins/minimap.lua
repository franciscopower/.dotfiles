return {
  "Isrothy/neominimap.nvim",
  version = "v3.*.*",
  enabled = true,
  lazy = false, -- NOTE: NO NEED to Lazy load
  -- Optional
  keys = {
    -- Global Minimap Controls
    -- { "<leader>nm", "<cmd>Neominimap toggle<cr>", desc = "Toggle global minimap" },

    -- Window-Specific Minimap Controls
    { "<leader>mm", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },

    ---Focus Controls
    { "<leader>mf", "<cmd>Neominimap toggleFocus<cr>", desc = "Switch focus on minimap" },
  },
  init = function()
    -- The following options are recommended when layout == "float"
    vim.opt.wrap = false
    vim.opt.sidescrolloff = 36 -- Set a large value

    --- Put your configuration here
    ---@type Neominimap.UserConfig
    vim.g.neominimap = {
      auto_enable = true,
      -- How many columns a dot should span
      x_multiplier = 4, ---@type integer
      click = {
        -- Enable mouse click on minimap
        enabled = false, ---@type boolean
        -- Automatically switch focus to minimap when clicked
        auto_switch_focus = true, ---@type boolean
      },
      search = {
        enabled = true, ---@type boolean
        mode = "line", ---@type Neominimap.Handler.Annotation.Mode
        priority = 20, ---@type integer
        icon = "󰱽 ", ---@type string
      },

    }
  end,
}
