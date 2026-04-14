-- Map [[ and ]] to forward and back jump to asciidoc headings
vim.api.nvim_create_autocmd("FileType", {
	pattern = "asciidoc",
	callback = function()
		local s = "^=\\+.*\\n\\s*\\n"
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"[[",
			"<cmd>silent! ?" .. s .. "<cr><cmd>nohlsearch<cr>",
			{ desc = "Asciidoc Previous Heading", silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"]]",
			"<cmd>silent! /" .. s .. "<cr><cmd>nohlsearch<cr>",
			{ desc = "Asciidoc Next Heading", silent = true, noremap = true }
		)
	end,
})

return {}
