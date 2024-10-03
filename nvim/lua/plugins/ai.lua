return {
  -- {
  --   "Exafunction/codeium.vim",
  --   config = function()
  --     -- Change '<C-g>' here to any keycode you like.
  --     vim.keymap.set("i", "<C-g>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<c-;>", function()
  --       return vim.fn["codeium#CycleCompletions"](1)
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<c-,>", function()
  --       return vim.fn["codeium#CycleCompletions"](-1)
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<c-x>", function()
  --       return vim.fn["codeium#Clear"]()
  --     end, { expr = true, silent = true })

  --     vim.g.codeium_filetypes = {
  --       markdown = false,
  --     }
  --   end,
  -- }, -- Run `:Codeium Auth` after installing the plugin
  -- {
  --   "robitx/gp.nvim",
  --   config = function()
  --     local conf = {
  --       -- For customization, refer to Install > Configuration in the Documentation/Readme
  --     }
  --     require("gp").setup(conf)

  --     -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  --   end,
  --   providers = {
  --     openai = {
  --       endpoint = "https://api.openai.com/v1/chat/completions",
  --       secret = os.getenv("GPTERMINAL_LLM_API_KEY"),
  --     },

  --     -- googleai = {
  --     -- 	endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:streamGenerateContent?key={{secret}}",
  --     -- 	secret = os.getenv("GOOGLEAI_API_KEY"),
  --     -- },

  --     -- anthropic = {
  --     -- 	endpoint = "https://api.anthropic.com/v1/messages",
  --     -- 	secret = os.getenv("ANTHROPIC_API_KEY"),
  --     -- },
  --   },
  -- },
}
