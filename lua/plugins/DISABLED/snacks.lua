local leader_find = Leader_none .. "F"
local leader_git = Leader_git
local leader_lsp = "gr"
local leader_profiler = Leader_other .. "P"
local leader_search = Leader_search
local leader_ui = Leader_ui

local enable_statuscolumn = true

return {
	"folke/snacks.nvim",
	--enabled = false,
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		--bigfile = { enabled = true }, -- changes filetype to prevent lsp's etc from triggering.
		dashboard = { enabled = false },

		explorer = { enabled = false },

		indent = {
			enabled = true,

			only_scope = false,
			only_current = false,

			-- highlighting current scope guide
			scope = {
				enabled = true,
			},
			chunk = { enabled = false },

			animate = {
				enabled = false,
			},
		},

		input = { enabled = true },

		notifier = {
			enabled = false,
			timeout = 3000,
		},

		picker = {
			enabled = true,
			sources = {
				explorer = {
					auto_close = false,
				},
			},
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		--scroll = { enabled = true },
		statuscolumn = { enabled = enable_statuscolumn },
		words = { enabled = true },
		styles = {
			notification = {
				-- wo = { wrap = true } -- Wrap notifications
			},
		},
	},
	keys = {
		{ leader_find, "", desc = "[F]ind" },
		{ leader_git, "", desc = "[G]it" },
		{ leader_lsp, "", desc = "[L]SP" },
		{ leader_profiler, "", desc = "[P]rofiler" },
		{ leader_search, "", desc = "[S]earch" },
		{ leader_ui, "", desc = "[U]ser Interface" },

		{
			leader_profiler .. "p",
			function()
				Snacks.profiler.toggle()
			end,
			desc = "Profiler Toggle",
		},
		{
			leader_profiler .. "h",
			function()
				Snacks.profiler.highlight()
			end,
			desc = "Profiler Highlights",
		},
		{
			leader_profiler .. "s",
			function()
				Snacks.profiler.scratch()
			end,
			desc = "Profiler Scratch Bufer",
		},

		-- Top Pickers & Explorer
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			Leader_none .. ",",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			Leader_none .. "/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			Leader_none .. ":",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			Leader_none .. "n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},

		--[[
		{
			"\\",
			function()
						Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		]]
		--
		{
			Leader_none .. "e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		-- find

		{
			leader_find .. "b",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			leader_find .. "c",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			leader_find .. "f",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			leader_find .. "g",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			leader_find .. "p",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			leader_find .. "r",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		-- git
		{
			leader_git .. "b",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			leader_git .. "l",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			leader_git .. "L",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git Log Line",
		},
		{
			leader_git .. "s",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			leader_git .. "S",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		{
			leader_git .. "d",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			leader_git .. "f",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git Log File",
		},
		-- gh
		{
			leader_git .. "i",
			function()
				Snacks.picker.gh_issue()
			end,
			desc = "GitHub Issues (open)",
		},
		{
			leader_git .. "I",
			function()
				Snacks.picker.gh_issue({ state = "all" })
			end,
			desc = "GitHub Issues (all)",
		},
		{
			leader_git .. "p",
			function()
				Snacks.picker.gh_pr()
			end,
			desc = "GitHub Pull Requests (open)",
		},
		{
			leader_git .. "P",
			function()
				Snacks.picker.gh_pr({ state = "all" })
			end,
			desc = "GitHub Pull Requests (all)",
		},
		-- Grep
		{
			leader_search .. "b",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			leader_search .. "B",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			leader_search .. "g",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			leader_search .. "w",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		-- search
		{
			leader_search .. '"',
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			leader_search .. "/",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search History",
		},
		{
			leader_search .. "a",
			function()
				Snacks.picker.autocmds()
			end,
			desc = "Autocmds",
		},
		{
			leader_search .. "b",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			leader_search .. "c",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			leader_search .. "C",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			leader_search .. "d",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			leader_search .. "D",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			leader_search .. "h",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			leader_search .. "H",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			leader_search .. "i",
			function()
				Snacks.picker.icons()
			end,
			desc = "Icons",
		},
		{
			leader_search .. "j",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},
		{
			leader_search .. "k",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			leader_search .. "l",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Location List",
		},
		{
			leader_search .. "m",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			leader_search .. "M",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			leader_search .. "p",
			function()
				Snacks.picker.lazy()
			end,
			desc = "Search for Plugin Spec",
		},
		{
			leader_search .. "q",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			leader_search .. "R",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			leader_search .. "u",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},
		{
			leader_ui .. "C",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		-- LSP
		--{ leader_lsp, "", desc = "LSP commands" },
		{
			leader_lsp .. "d",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definitions",
		},
		{
			leader_lsp .. "D",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto [D]eclaration",
		},
		{
			leader_lsp .. "r",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "[R]eferences",
		},

		{
			leader_lsp .. "s",
			function()
				vim.lsp.buf.document_symbol()
			end,
			desc = "Document [S]ymbols",
		},

		{
			leader_lsp .. "i",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto [I]mplementation",
		},
		{
			leader_lsp .. "t",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto [T]ype Definition",
		},
		{ leader_lsp .. "c", "", desc = "[C]alls" },
		{
			leader_lsp .. "ci",
			function()
				Snacks.picker.lsp_incoming_calls()
			end,
			desc = "Calls [I]ncoming",
		},
		{
			leader_lsp .. "co",
			function()
				Snacks.picker.lsp_outgoing_calls()
			end,
			desc = "Calls [O]utgoing",
		},
		{
			leader_search .. "s",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			leader_search .. "s",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			leader_search .. "S",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		-- Other
		{
			Leader_none .. "z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
		{
			Leader_none .. "Z",
			function()
				Snacks.zen.zoom()
			end,
			desc = "Toggle Zoom",
		},
		{
			Leader_none .. ".",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			Leader_none .. "S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			Leader_none .. "n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		--[[
		{
			Leader_none .. "bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			Leader_none .. "cR",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
		--]]
		{
			leader_git .. "B",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},
		{
			leader_git .. "g",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			leader_ui .. "n",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<c-/>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
		{
			"<c-_>",
			function()
				Snacks.terminal()
			end,
			desc = "which_key_ignore",
		},
		{
			leader_lsp .. "]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			leader_lsp .. "[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
		{
			Leader_none .. "N",
			desc = "Neovim News",
			function()
				Snacks.win({
					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
					width = 0.6,
					height = 0.6,
					wo = {
						spell = false,
						wrap = false,
						signcolumn = "yes",
						statuscolumn = " ",
						conceallevel = 3,
					},
				})
			end,
		},
		--]]
	},
	init = function()
		-- Set the statuscolumn to 1 wide because the snacks gutter only shows 1 icon to the left of the line number.
		if enable_statuscolumn then
			vim.opt.signcolumn = "auto:1"
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				function on_confirm(value) end

				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end

				-- Override print to use snacks for `:=` command
				if vim.fn.has("nvim-0.11") == 1 then
					vim._print = function(_, ...)
						dd(...)
					end
				else
					vim.print = _G.dd
				end

				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map(leader_ui .. "s")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map(leader_ui .. "w")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map(leader_ui .. "L")
				Snacks.toggle.diagnostics():map(leader_ui .. "d")
				Snacks.toggle.line_number():map(leader_ui .. "l")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map(leader_ui .. "c")
				Snacks.toggle.treesitter():map(leader_ui .. "T")
				Snacks.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map(leader_ui .. "b")
				Snacks.toggle.inlay_hints():map(leader_ui .. "h")
				Snacks.toggle.indent():map(leader_ui .. "g")
				Snacks.toggle.dim():map(leader_ui .. "D")
			end,
		})
	end,
}
