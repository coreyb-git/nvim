local leader_lsp = "gr"
local leader_search = Leader_search

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
		end

		-- Fuzzy find all the symbols in your current document.
		--  Symbols are things like variables, functions, types, etc.
		map(leader_lsp .. "s", require("telescope.builtin").lsp_document_symbols, "Document [S]ymbols")

		-- Fuzzy find all the symbols in your current workspace.
		--  Similar to document symbols, except searches over your entire project.
		map(leader_lsp .. "S", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace [S]ymbols")
	end,
})

return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
	},

	config = function()
		require("telescope").setup({
			-- You can put your default mappings / updates / etc. in here
			--  All the info you're looking for is in `:help telescope.setup()`
			--
			-- defaults = {
			--   mappings = {
			--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
			--   },
			-- },
			-- pickers = {}
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Jump to the type of the word under your cursor.
		--  Useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		--map(leader .. "t", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		vim.keymap.set("n", leader_search .. "a", "<cmd>Telescope<cr>", { desc = "Telescope [A]ctions Popup" })
		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find Existing Buffers" })
		vim.keymap.set("n", "<leader>\\", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>.", builtin.oldfiles, { desc = "Recent Files" })

		vim.keymap.set("n", leader_search .. "h", builtin.help_tags, { desc = "[H]elp" })
		vim.keymap.set("n", leader_search .. "k", builtin.keymaps, { desc = "[K]eymaps" })
		vim.keymap.set("n", leader_search .. "f", builtin.find_files, { desc = "[F]iles" })
		vim.keymap.set("n", leader_search .. "s", builtin.builtin, { desc = "[S]elect Telescope" })
		vim.keymap.set("n", leader_search .. "w", builtin.grep_string, { desc = "current [W]ord" })
		vim.keymap.set("n", leader_search .. "g", builtin.live_grep, { desc = "[G]rep" })
		vim.keymap.set("n", leader_search .. "d", builtin.diagnostics, { desc = "[D]iagnostics" })
		vim.keymap.set("n", leader_search .. "r", builtin.resume, { desc = "[R]esume" })
		vim.keymap.set("n", leader_search .. ".", builtin.oldfiles, { desc = "Recent Files" })

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set("n", leader_search .. "/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", leader_search .. "n", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[N]eovim files" })
	end,
}
