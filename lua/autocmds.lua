-- Disable listchars for other buffers
vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function()
		if vim.bo.buftype ~= "" then
			--			vim.cmd("setlocal nolist")
			--			vim.cmd("setlocal nonumber")
			--			vim.cmd("setlocal norelativenumber")
		end
	end,
})

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		--		vim.highlight.on_yank()
		vim.hl.on_yank()
	end,
})

-- Settings for text files
vim.g.Pattern_TextFiles = { "*.md", "*.adoc", "*.txt", "*.log" }

local TextFileGroup = "TextFileSettings"
vim.api.nvim_create_augroup(TextFileGroup, { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { -- perform only once on loading
	pattern = vim.g.Pattern_TextFiles,
	group = TextFileGroup,
	callback = function()
		vim.opt_local.cursorlineopt = "number"
		vim.opt_local.foldcolumn = "0" -- disable
		vim.opt_local.wrap = true --visually wrap text within window area
		vim.cmd("setlocal linebreak") --only wrap at word boundaries etc
		vim.cmd("setlocal nonumber") --disable line numbers
		vim.cmd("setlocal nolist") -- disable listchars indent guides

		vim.keymap.set("n", "0", "g0", { noremap = true, silent = true, desc = "Start of screen line", buffer = true })
		vim.keymap.set("n", "$", "g$", { noremap = true, silent = true, desc = "End of screen line", buffer = true })
	end,
})
----

-- Use Trouble.nvim instead.
--[[
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	callback = function()
		vim.diagnostic.open_float()
	end,
})
]]
--

-- diagnostic settings to try to fix lag
local function disableSettings()
	vim.schedule(function()
		--disable lsp_lines, and all diagnostics
		local m = {
			virtual_lines = false,
			signs = false,
			underline = false,
			--	update_in_insert = false,
		}
		--vim.diagnostic.config(m)
		--vim.cmd("TSDisable highlight incremental_selection indent textobjects rainbow")
		--vim.cmd("set nospell")
		--		vim.cmd("set nolinebreak")
	end)
end

local function enableSettings()
	vim.schedule(function()
		local m = {
			virtual_lines = true,
			signs = true,
			underline = true,
			--	update_in_insert = true,
		}
		--vim.diagnostic.config(m)
		--vim.cmd("TSEnable highlight incremental_selection indent textobjects rainbow")
		--vim.cmd("set spell")
		--		vim.cmd("set linebreak")
	end)
end
--[[
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	pattern = "*",
	callback = disableSettings,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	pattern = "*",
	callback = enableSettings,
})
]]
--
----

--restore cursor position on file load
local api = vim.api
vim.api.nvim_create_autocmd({ "BufRead", "BufReadPost" }, {
	callback = function()
		local row, column = unpack(api.nvim_buf_get_mark(0, '"'))
		local buf_line_count = api.nvim_buf_line_count(0)

		if row >= 1 and row <= buf_line_count then
			api.nvim_win_set_cursor(0, { row, column })
		end
	end,
})
----

-- Winbars
local function update_winbars()
	local wins = vim.api.nvim_tabpage_list_wins(0)
	-- Filter out "non-real" windows like NvimTree or floating windows if desired
	local real_wins = {}
	for _, win in ipairs(wins) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].buftype == "" then
			table.insert(real_wins, win)
		end
	end

	if #real_wins > 1 then
		-- SHOW winbar when multiple windows are open
		for _, win in ipairs(real_wins) do
			vim.wo[win].winbar = "%f %m" -- Filename and Modified flag
		end
	else
		-- HIDE winbar when only one window is open
		for _, win in ipairs(real_wins) do
			vim.wo[win].winbar = nil
		end
	end
end

-- Trigger the update on layout changes
vim.api.nvim_create_autocmd({ "WinEnter", "WinClosed", "BufWinEnter" }, {
	callback = function()
		-- Use a small defer to ensure the window count is accurate
		-- after a window is closed or opened
		vim.schedule(update_winbars)
	end,
})
----

return {}
