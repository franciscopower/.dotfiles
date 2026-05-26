local function pack_clean()
	local active_plugins = {}
	local unused_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		active_plugins[plugin.spec.name] = plugin.active
	end

	for _, plugin in ipairs(vim.pack.get()) do
		if not active_plugins[plugin.spec.name] then
			table.insert(unused_plugins, plugin.spec.name)
		end
	end

	if #unused_plugins == 0 then
		print("No unused plugins.")
		return
	end

	local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
	if choice == 1 then
		vim.pack.del(unused_plugins)
	end
end
vim.api.nvim_create_user_command("PackClean", pack_clean, {})

local function pack_list()
	local plugins = {}
	for _, plugin in ipairs(vim.pack.get()) do
		table.insert(plugins, plugin.spec.name)
	end

	table.sort(plugins)

	print(table.concat(plugins, "\n"))
end
vim.api.nvim_create_user_command("PackList", pack_list, {})
