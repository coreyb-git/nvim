local leader = Leader_other_writing

return {
	"archie-judd/telescope-words.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		vim.keymap.set(
			"n",
			leader .. "d",
			require("telescope").extensions.telescope_words.search_dictionary_for_word_under_cursor,
			{ desc = "[d]ictionary" }
		)
		vim.keymap.set(
			"n",
			leader .. "t",
			require("telescope").extensions.telescope_words.search_thesaurus_for_word_under_cursor,
			{ desc = "[t]hesaurus" }
		)
	end,
}
