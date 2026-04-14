local leader = Leader_windows_fileexplorers .. "n"

return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	keys = {
		{ leader, "<cmd>NvimTreeToggle<cr>", desc = "[N]Vim-Tree" },

		{ "\\", "<cmd>NvimTreeToggle<cr>", desc = "NVim-Tree Toggle" },
	},
	opts = {
		view = {
			signcolumn = "yes",
		},
		modified = {
			enable = true,
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
		},
		update_focused_file = {
			enable = true,
		},
		renderer = {
			icons = {
				--git_placement = "signcolumn",
				git_placement = "before",
				diagnostics_placement = "after",
				bookmarks_placement = "after",

				show = {
					git = true,
				},

				glyphs = {
					git = {
						unstaged = "⸾",
					},
				},
			},
		},
	},
}
