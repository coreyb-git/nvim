-- Opens browser and live previews the current file.

local leader = Leader_none .. "M"

return {
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown", "vimwiki", "quarto" }
			vim.g.mkdp_refresh_slow = 1 --don't update on every text change.
			vim.g.mkdp_auto_close = 0
		end,
		ft = { "markdown" },
		keys = {
			{ leader, "", mode = { "n" }, desc = "[M]arkdown", ft = "markdown" },
			{
				leader .. "p",
				"<cmd>MarkdownPreviewToggle<cr>",
				mode = { "n" },
				desc = "[P]review Toggle",
				ft = "markdown",
			},
		},
	},
}
