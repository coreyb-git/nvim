local leader = Leader_git .. "m"

return {
	"nvim-mini/mini.diff",
	opts = {
		view = {
			style = "sign",
		},
		source = nil,
	},
	config = function()
		local MiniDiff = require("mini.diff")
		vim.keymap.set("n", leader, MiniDiff.toggle_overlay, { desc = "Toggle [M]iniDiff overlay" })
	end,
}
