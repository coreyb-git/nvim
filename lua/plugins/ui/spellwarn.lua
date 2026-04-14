local leader = Leader_windows .. "s"

return {
	--	"ravibrock/spellwarn.nvim",
	"coreyb-git/spellwarn.nvim",
	--dev = true,
	--enabled = false,
	opts = {
		event = { "CursorHold" },
	},
	keys = {
		{ leader, "<cmd>Spellwarn qflist<cr>", desc = "[S]pelling Errors" },
	},
}
