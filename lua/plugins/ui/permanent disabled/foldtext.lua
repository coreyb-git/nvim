-- This also overrides any custom fillchars
local saved = vim.o.fillchars

return {
	"OXY2DEV/foldtext.nvim",
	lazy = false,
	config = function()
		require("foldtext").setup()
		vim.o.fillchars = saved -- restore settings after init.
	end,
}
