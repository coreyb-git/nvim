return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		preset = "helix",
		spec = {
			{ Leader_git, group = "[G]it" },
			{ Leader_other, group = "[O]ther" },
			{ Leader_other_writing, group = "[W]riting" },
			{ Leader_search, group = "[S]earch" },
			{ Leader_ui, group = "[U]ser Interface" },
			{ Leader_windows, group = "[W]indows" },
		},
	},
}
