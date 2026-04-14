local fps = 20
local hertz = math.floor(1000 / fps)

return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				globalstatus = true,
				refresh = {
					statusline = 2000,
					tabline = 2000,
					winbar = 2000,
					refresh_time = hertz,
				},
			},
		},
	},

	{
		"coreyb-git/custom-lualine.nvim",
		--enabled = false,
		--dev = true,
		dependencies = {
			"nvim-lualine/lualine.nvim",
			"coreyb-git/upower.nvim",
			"epwalsh/pomo.nvim",
		},
		opts = {},
		lazy = false,
	},
}
