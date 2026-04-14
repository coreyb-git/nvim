local leader = Leader_windows .. "a"

return {
	"stevearc/aerial.nvim",
	--enabled = false,
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
	},

	keys = {
		{ leader, "<cmd>AerialToggle!<cr>", desc = "[A]erial Toggle" },

		{ "<A-\\>", "<cmd>AerialToggle!<cr>", desc = "Aerial Toggle" },
	},
	opts = {
		icons = {
			markdown = {
				Interface = "", --filled dot
				--Interface = "", --hollow dot
			},
			asciidoc = {
				Interface = "", --filled dot
			},
			asciidoctor = {
				Interface = "", --filled dot
			},
		},

		layout = {
			-- These control the width of the aerial window.
			--  They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			-- min_width and max_width can be a list of mixed types.
			-- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
			max_width = { 40, 0.2 },
			width = nil,
			--min_width = 30,

			--placement = "edge",
		},

		attach_mode = "global",

		-- List of enum values that configure when to auto-close the aerial window
		--   unfocus       - close aerial when you leave the original source window
		--   switch_buffer - close aerial when you change buffers in the source window
		--   unsupported   - close aerial when attaching to a buffer that has no symbol source
		--close_automatic_events = { "unfocus", "switch_buffer", "unsupported" },
		--		close_automatic_events = { "unfocus" },

		-- When true, don't load aerial until a command or function is called
		-- Defaults to true, unless `on_attach` is provided, then it defaults to false
		--lazy_load = true,

		manage_folds = false, --true,
		link_folds_to_tree = false, --true,
		link_tree_to_folds = false, --true,

		nerd_font = "auto",
		--nerd_font = true,

		-- Automatically open aerial when entering supported buffers.
		-- This can be a function (see :help aerial-open-automatic)
		--open_automatic = false,
		open_automatic = function(bufnr)
			--			return require("aerial").num_symbols(bufnr) > 0
			return false
		end,

		show_guides = true,
	},
}
