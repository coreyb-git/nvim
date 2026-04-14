-- Display the marks in the sidebar
-- NOTE: Polls the marks list to maintain the gutter
return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	opts = {
		refresh_interval = 1000,
	},
}
