local leader_search = Leader_search
local leader_window = Leader_windows

-- Highlight todo, notes, etc in comments
-- TODO:
-- FIXME:
-- HACK:
-- WARN:
-- NOTE:
return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VimEnter",
	opts = {},
	keys = {
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next todo comment",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous todo comment",
		},
		{ leader_window .. "t", "<cmd>TodoQuickFix<CR>", desc = "Todo (QuickFix List)" },
	},
	config = function()
		require("todo-comments").setup()

		if package.loaded["telescope"] then
			vim.keymap.set("n", leader_search .. "T", "<cmd>TodoTelescope<cr>", { desc = "Todo (Telescope)" })
		end
	end,
}
