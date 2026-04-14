vim.diagnostic.config({
	update_in_insert = false,
	virtual_text = false,
	virtual_lines = false,
	underline = true,
})

return {
	"rachartier/tiny-inline-diagnostic.nvim",
	--"coreyb-git/tiny-inline-diagnostic.nvim",
	--enabled = false,

	--dev = true,

	event = "VimEnter",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			disabled_ft = {
							"qf",
			},

			options = {
				-- doesn't work with markdown or text files without this.
				overwrite_events = { "LspAttach", "BufWinEnter" },

				multilines = {
					enabled = true,
					always_show = true,
				},

				overflow = {
					--mode = "oneline",
					padding = 5,
				},

				show_source = {
					enabled = true,
					--if_many = true,
				},

				throttle = 1000,

				use_icons_from_diagnostic = true,

				virtual_texts = {
					priority = 5,
				},

				--show_all_diags_on_cursorline = true,
			},
		})
	end,
}
