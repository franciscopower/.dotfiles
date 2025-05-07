-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Plugins
require("plugins")

-- Custom Commands
local commands = require("commands")
wezterm.on("augment-command-palette", function()
	return commands
end)

-- This will hold the configuration.
local config = wezterm.config_builder()


-- Appearance
config.default_prog = { "powershell.exe", "-nologo" }

local launch_menu = {}
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "powershell.exe", "-NoLogo" },
	})

	-- Find installed visual studio version(s) and add their compilation
	-- environment command prompts to the menu
	for _, vsvers in ipairs(wezterm.glob("Microsoft Visual Studio/20*", "C:/Program Files (x86)")) do
		local year = vsvers:gsub("Microsoft Visual Studio/", "")
		table.insert(launch_menu, {
			label = "x64 Native Tools VS " .. year,
			args = {
				"cmd.exe",
				"/k",
				"C:/Program Files (x86)/" .. vsvers .. "/BuildTools/VC/Auxiliary/Build/vcvars64.bat",
			},
		})
	end
end
config.launch_menu = launch_menu

-- Appearance
local DARKBLUE ="#01061A"
local WHITE ="#F8F8F2"

config.colors = {
	background = DARKBLUE,
  foreground = WHITE,
	cursor_bg = WHITE,
}

config.color_scheme = 'Catppuccin Macchiato'
config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.win32_system_backdrop = "Acrylic"
config.window_background_opacity = 0.8

-- Keymaps
-- config.leader = { key = 'Space', mods = 'CTRL' }
config.leader = { key = "ç" }
config.keys = {
  { key = "v", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
	{
		mods = "LEADER",
		key = "t",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "p",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "LEADER",
		key = "+",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "ALT",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "ALT",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "ALT",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "ALT",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
}

for i = 0, 8 do
	table.insert(config.keys, {
		mods = "LEADER",
		key = tostring(i + 1),
		action = wezterm.action.ActivateTab(i),
	})
end


-- and finally, return the configuration to wezterm
return config
