-- auto build on update
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, path = ev.data.spec.name, ev.data.path
		if name == "nvim-pretty-ts-errors" then
			vim.fn.system("cd " .. path .. " && npm install")
			vim.notify("nvim-pretty-ts-errors installed and loaded", vim.log.levels.INFO)
		end
	end,
})

vim.pack.add({ "https://github.com/enochchau/nvim-pretty-ts-errors" })
vim.keymap.set("n", "<leader>vd", require("nvim-pretty-ts-errors").show_line_diagnostics)
