-- other/neowiki
local leader = Leader_other .. "n"
local leader_neowiki = leader

return {
	{
		"echaya/neowiki.nvim",
		opts = {
			gtd = {
				show_gtd_progress = false,
			},

			wiki_dirs = {
				-- neowiki.nvim supports both absolute and tilde-expanded paths
				{ name = "Personal_Wiki", path = "~/Documents/neowiki/personal" },
				{ name = "Work_Wiki", path = "~/Documents/neowiki/work" },
				{ name = "Documentation_Wiki", path = "~/Documents/neowiki/docs_wiki" },
			},

			keymaps = {
				rename_page = leader_neowiki .. "r",
				-- Deletes the current wiki page and updates backlinks.
				delete_page = leader_neowiki .. "d",
				-- Inserts a link to another wiki page.
				insert_link = leader_neowiki .. "i",
				-- Removes all links in the current file that point to non-existent pages.
				cleanup_links = leader_neowiki .. "c",

				-- Toggles the status of a gtd item.
				-- Works on the current line in Normal mode and on the selection in Visual mode.
				toggle_task = leader_neowiki .. "t",
			},
		},
		keys = {
			{ leader, "", desc = "[N]eo Wiki" },
			{ leader .. "w", "<cmd>lua require('neowiki').open_wiki()<cr>", desc = "Open Wiki" },
			{
				leader .. "f",
				"<cmd>lua require('neowiki').open_wiki_floating()<cr>",
				desc = "Open Wiki in Floating Window",
			},
			{ leader .. "t", "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>", desc = "Open Wiki in Tab" },
		},
	},

	{
		"coreyb-git/backlinks.nvim",
		--dev = true,
		keys = {
			{
				leader .. "b",
				function()
					require("backlinks").list_backlinks(vim.fn.expand("%:p:h"))
				end,
				desc = "[B]acklinks List",
			},
		},

		config = function()
			require("backlinks")

			vim.g.backlinks_search_dir = "~/Documents/neowiki/"
		end,
	},
}
