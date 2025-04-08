return {
  -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {"rcarriga/nvim-notify",
      opts = {
        background_colour = "#000000",
      }
    }
  },
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true,      -- use a classic bottom cmdline for search
      command_palette = true,    -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,        -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true,     -- add a border to hover docs and signature help
    },
    messages = {
      enabled = true,           -- enables the Noice messages UI
      view = "notify",          -- default view for messages
      view_error = "notify",    -- view for errors
      view_warn = "notify",     -- view for warnings
      view_history = "messages", -- view for :messages
      view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    routes = {
      {
        view = "mini",
        filter = { event = "msg_showmode" },
      },
    },
  },
  keys = {
    {
      "<leader>nl", "<CMD>Noice telescope<CR>",
      desc = "Notifications list ",
    },
    {
      "<leader>nd", "<CMD>Noice dismiss<CR>",
      desc = "Notifications dismiss",
    },

  },
}
