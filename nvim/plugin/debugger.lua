vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.pack.add({
			"https://github.com/mfussenegger/nvim-dap",
			"https://github.com/jay-babu/mason-nvim-dap.nvim",
			"https://github.com/mason-org/mason.nvim",
			"https://github.com/nvim-neotest/nvim-nio",
			"https://github.com/mfussenegger/nvim-dap-python",
			"https://github.com/leoluz/nvim-dap-go",
			"https://github.com/rcarriga/nvim-dap-ui",
		})

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
	once = true,
})
