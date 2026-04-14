local leader = Leader_windows_fileexplorers .. "o"

return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = false,
	},
	dependencies = {
		{ "nvim-mini/mini.icons", opts = {} },
	},
	lazy = false,
	keys = {
		{ leader, "<cmd>Oil<cr>", desc = "[O]il" },
	},
}
