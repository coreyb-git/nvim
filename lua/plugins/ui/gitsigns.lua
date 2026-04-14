local leader_hunk = Leader_git .. "h"
local leader_toggle = Leader_git .. "t"

-- See `:help gitsigns` to understand what the configuration keys do
return {
	"lewis6991/gitsigns.nvim",

	opts = {
		update_debounce = 1000,
		signs = {
			--add = { text = "+" },
			--add = { text = "|" },
			--add = { text = "▎" },
			add = { text = "▌" },
			--add = { text = "█" },

			--change = {text = "~"},
			--change = {text = "|"},
			--change = {text = "▎"},
			--change = { text = "▌" },
			change = { text = "⸾" },
			--change = {text = "█"},

			--delete = {text = "_"},
			delete = { text = "▂" },

			--topdelete = {text = "▔"},

			changedelete = { text = "▌" },

			--untracked    = { text = '┆' },
		},

		signs_staged = {
			add = { text = "+" },
			change = { text = "+" },
			delete = { text = "-" },
			topdelete = { text = "-" },
			changedelete = { text = "-" },
			untracked = { text = "?" },
		},

		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Heading setup.
			map("n", leader_hunk, "", { desc = "[H]unk" })
			map("n", leader_toggle, "", { desc = "Git Signs [T]oggle" })

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, { desc = "Nav hunk next" })

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "Nav hunk previous" })

			-- Actions
			map("n", leader_hunk .. "s", gitsigns.stage_hunk, { desc = "Stage hunk" })
			map("n", leader_hunk .. "r", gitsigns.reset_hunk, { desc = "Reset hunk" })

			map("v", leader_hunk .. "s", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Stage hunk" })

			map("v", leader_hunk .. "r", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Reset hunk" })

			map("n", leader_hunk .. "S", gitsigns.stage_buffer, { desc = "Stage buffer" })
			map("n", leader_hunk .. "R", gitsigns.reset_buffer, { desc = "Reset buffer" })
			map("n", leader_hunk .. "p", gitsigns.preview_hunk, { desc = "Preview hunk" })
			map("n", leader_hunk .. "i", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })

			map("n", leader_hunk .. "b", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Blame line" })

			map("n", leader_hunk .. "d", gitsigns.diffthis, { desc = "Diff this" })

			map("n", leader_hunk .. "D", function()
				gitsigns.diffthis("~")
			end, { desc = "Diff this ~" })

			map("n", leader_hunk .. "Q", function()
				gitsigns.setqflist("all")
			end, { desc = "Setqflist All" })
			map("n", leader_hunk .. "q", gitsigns.setqflist, { desc = "Setqflist" })

			-- Toggles
			map("n", leader_toggle .. "b", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
			map("n", leader_toggle .. "w", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })

			-- Text object
			map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select hunk" })
		end,
	},
}
