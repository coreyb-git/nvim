local leader = Leader_ui .. "S"

return {
	"coreyb-git/statuscolumn.nvim",
	config = function()
		vim.keymap.set("n", leader, require("statuscolumn").toggle, { desc = "Toggle [S]tatusColumn" })
	end,
}
