-- markdown viewer.  Using to inline render mathjax and latex
return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	config = function()
		require("markview").setup({
			preview = {
				enable = true,
				enable_hybrid_mode = true,

				--debounce = 500,

				filetypes = { "markdown", "vimwiki" },

				hybrid_modes = { "n" },
				--linewise_hybrid_mode = true,
			},

			markdown = {
				enable = false, --let render-markdown handle it
			},
			markdown_inline = {
				enable = false,
			},
			html = {
				enable = false,
			},

			latex = {}, --handle mathjax and latex

			yaml = {
				enable = false,
			},
			typst = {
				enable = false,
			},
		})
	end,
}
