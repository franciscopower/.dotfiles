return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local colors = {
			blue = "#80a0ff",
			darkblue = "#0d081b",
			cyan = "#79dac8",
			black = "#080808",
			white = "#c6c6c6",
			red = "#ff5189",
      orange = "#f24c4d",
		}

		require("lualine").setup({
			options = {
				component_separators = "",
				section_separators = { left = "", right = "" },
				tab_separators = { left = "", right = "" },
        disabled_filetypes = {'neo-tree', 'Avante', 'AvanteInput', 'AvanteSelectedFiles'},
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = { {"filename", path=1}, "branch" },
				lualine_c = {
					"%=", --[[ add your center compoentnts here in place of this comment ]]
				},
				lualine_x = {},
				lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
