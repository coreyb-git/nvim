return {
	"nvim-mini/mini.files",
	keys = {
		{ "\\", "<CMD>lua MiniFiles.open()<CR>", desc = "Mini Files" },
	},
	config = function()
		require("mini.files").setup({
			options = {
				use_as_default_explorer = false,
			},
		})
	end,
}
