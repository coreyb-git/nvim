local leader = Leader_windows .. "T"

return {
	"folke/trouble.nvim",
	lazy = false,
	cmd = "Trouble",
	opts = {
		modes = {
			diagnostics = {
				mode = "diagnostics",
				filter = { buf = 0 },
				--auto_open = true,
				--auto_close = true,
				win = {
					size = 7,
				},
			},
		},
	}, -- for default options, refer to the configuration section for custom setup.
	keys = {
		{
			leader,
			"",
			desc = "[T]rouble",
		},
		{
			leader .. "x",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			leader .. "X",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Project Diagnostics (Trouble)",
		},
		{
			leader .. "s",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			leader .. "l",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			leader .. "L",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			leader .. "q",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}
