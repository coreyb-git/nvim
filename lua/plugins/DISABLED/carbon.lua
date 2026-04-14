local leader = Leader_windows_fileexplorers .. "c"

local function toggle_carbon()
	require("carbon").toggle_sidebar()
end

return {
	"sidOfc/carbon.nvim",
	lazy = false,
	keys = {
		{ leader, toggle_carbon, desc = "[C]arbon File Explorer" },

		{ "\\", toggle_carbon, desc = "Carbon Toggle" },
	},
	opts = {
		auto_open = false,
		--keep_netrw = true,
	},
}
