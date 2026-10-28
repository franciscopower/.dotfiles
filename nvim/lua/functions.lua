local function pack_list()
	local plugins = {}
	for _, plugin in ipairs(vim.pack.get()) do
		table.insert(plugins, plugin.spec.name)
	end

	table.sort(plugins)

	print(table.concat(plugins, "\n"))
end
vim.api.nvim_create_user_command("PackList", pack_list, {})
