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
        },
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
      "mason-org/mason.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup({
        automatic_installation = true,
        ensure_installed = {
          "delve",
          "python",
        },
        handlers = {
          function(config)
            -- all sources with no handler get passed here

            -- Keep original functionality
            require("mason-nvim-dap").default_setup(config)
          end,
          python = function(config)
            config.adapters = {
              type = "executable",
              command = "python",
              args = {
                "-m",
                "debugpy.adapter",
              },
            }
            require("mason-nvim-dap").default_setup(config) -- don't forget this!
          end,
        },
      })
    end,
  },
}
