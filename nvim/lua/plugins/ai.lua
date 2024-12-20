return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = false, -- default true
				},
				suggestion = {
					enabled = true,
					auto_trigger = true, -- default false
					hide_during_completion = true,
					debounce = 75,
					keymap = {
						accept = "<C-k>", -- default "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = true, -- default false
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
    branch = "main",
		config = function()
			require("CopilotChat").setup()

			vim.keymap.set("n", "<leader>ac", ":CopilotChat") -- Open the chat window
			vim.keymap.set("n", "<leader>ai", ":CopilotChatToggle<CR>") -- Toggle the chat window
			vim.keymap.set("v", "<leader>ae", ":CopilotChatExplain<CR>") -- Write an explanation for the active selection as paragraphs of text
			vim.keymap.set("v", "<leader>ar", ":CopilotChatReview<CR>") -- Review the selected code
			vim.keymap.set("v", "<leader>af", ":CopilotChatFix<CR>") -- There is a problem in this code. Rewrite the code to show it with the bug fixed
			vim.keymap.set("v", "<leader>ao", ":CopilotChatOptimize<CR>") -- Optimize the selected code to improve performance and readability
			vim.keymap.set("v", "<leader>ad", ":CopilotChatDocs<CR>") -- Please a-dd documentation comment for the selection
			vim.keymap.set({"v", "n"}, "<leader>at", ":CopilotChatTests<CR>") -- Please generate tests for my code
			-- vim.keymap.set("n", "<leader>a", ":CopilotChatFixDiagnostic<CR>") -- Please assist with the following diagnostic issue in file
			vim.keymap.set("n", "<leader>ag", ":CopilotChatCommitStaged<CR>") -- Write commit message for the change with commitizen convention
		end,
	},
}
