local leader = Leader_other .. "k"

return {
	"coreyb-git/keyboardlayout.nvim",
	--dev = true,
	dependencies = {},
	keys = {
		{ leader, "", desc = "[K]eyboard Layout" },
		{ leader .. "g", "<cmd>KeyboardLayoutShowGuide<cr>", desc = "[g]uide" },
		{ leader .. "c", "<cmd>KeyboardLayoutMapToColemak<cr>", desc = "[c]olemak key layout" },
		{ leader .. "d", "<cmd>KeyboardLayoutMapToDvorak<cr>", desc = "[d]vorak key layout" },
		{ leader .. "q", "<cmd>KeyboardLayoutMapToQWERTY<cr>", desc = "[q]qwerty key layout" },
	},
	opts = {
		ShowGuide = false,
		--InitialLayout = "dvorak",
	},
	lazy = false,
}
