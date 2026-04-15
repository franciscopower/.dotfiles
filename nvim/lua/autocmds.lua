-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- Keymap to copy current diagnostics to the system clipboard
vim.keymap.set("n", "<leader>dy", function()
	local current_word = vim.fn.expand("<cword>") -- Get the word under the cursor
	local diagnostics = vim.diagnostic.get(0) -- Get diagnostics for the current buffer
	local diagnostic_messages = {}
	for _, diagnostic in ipairs(diagnostics) do
		if string.find(diagnostic.message, current_word) then
			table.insert(diagnostic_messages, diagnostic.message)
		end
	end
	local diagnostic_text = table.concat(diagnostic_messages, "\n")
	vim.fn.setreg("+", diagnostic_text) -- Copy to system clipboard
	print("Diagnostics for '" .. current_word .. "' copied to clipboard")
end, { remap = false, desc = "Copy diagnostics to clipboard" })
