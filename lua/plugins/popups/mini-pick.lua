local leader_search = Leader_search

return {
	"nvim-mini/mini.pick",
	opts = {},
	config = function()
		local function search(key, cmd, desc)
			vim.keymap.set("n", leader_search .. key, cmd, { desc = desc })
		end

		local MiniPick = require("mini.pick")

		vim.keymap.set("n", "<leader><leader>", MiniPick.builtin.buffers, { desc = "Find Existing Buffers" })
		vim.keymap.set("n", "<leader>\\", MiniPick.builtin.files, { desc = "Find [F]iles" })

		search("f", MiniPick.builtin.files, "[F]iles")
		search("g", MiniPick.builtin.grep_live, "[G]rep")
		search("h", MiniPick.builtin.help, "[H]elp")
	end,
}
