return {
	"nvim-mini/mini.completion",
	config = function()
		require("mini.completion").setup({
			delay = {
				--	completion = 1000,
				--	info = 1000,
				--	signature = 1000,
			},

			fallback_action = "", -- only include lsp in popup.

			mappings = {
				--				scroll_down = "<TAB>",
				--				scroll_up = "<S-TAB>",
			},
		})

		local imap_expr = function(lhs, rhs)
			vim.keymap.set("i", lhs, rhs, { expr = true, replace_keycodes = false })
		end

		-- Navigate with Tab / Shift-Tab
		imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
		imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

		-- Optional: Make Enter confirm the selection
		vim.keymap.set("i", "<CR>", [[pumvisible() ? "\<C-y>" : "\<CR>"]], { expr = true })
	end,
}
