local leader = Leader_ui .. "i"
vim.keymap.set("n", leader, "", { desc = "[I]ndent" })
vim.keymap.set("n", leader .. "t", function()
	require("indentmini").toggle()
end, { desc = "[T]oggle" })

return {
	"nvimdev/indentmini.nvim",
	lazy = false,
	opts = {
		only_current = false,
		exclude = { "markdown", "asciidoc", "text" },
	},
}
