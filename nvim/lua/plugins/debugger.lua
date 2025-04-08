return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap-python",
      "leoluz/nvim-dap-go",
    },
    lazy = true,
    config = function()
      local dap = require("dap")

      -- keymaps
      vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Debugger: toggle breakpoint" })
      vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Debugger: run/continue" })

      ------------------------------
      -- Debugging configurations --
      ------------------------------

      -- IMPORTANT: requires `pip install debugpy`
      require("dap-python").setup("python")
      require("dap-go").setup({
        delve = {
          detached = false,
        }
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup({
        automatic_installation = true,
        ensure_installed = {
          "delve"
        },
        handlers = {},
      })
    end,
  },
}
