-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- check for no nerd font signal
if vim.g.is_tty ~= nil then
	vim.g.have_nerd_font = false
end

vim.opt.completeopt = "menuone,noinsert,fuzzy,popup"

vim.opt.termguicolors = true

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

--

--vim.opt.lazyredraw = true

vim.cmd("set nomodeline")

vim.o.showcmd = false
vim.o.wrapscan = false -- continue searching from start after reaching EOF
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.opt.fillchars = [[eob:█,fold: ,foldopen:┌,foldsep:│,foldclose:]]

-- jcroql
--vim.opt.formations = 'jcroql'
--jtcqln
--

vim.o.signcolumn = "yes:1" -- I override this when using custom statuscolumn
vim.o.statuscolumn = " %=%l %s%C│ " -- default simple statuscolumn before overriding with plugin

vim.o.winborder = "rounded"

vim.cmd("set nowrap")

vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set smoothscroll")

vim.o.tabstop = 2
vim.o.shiftwidth = 0    -- 0 = use tabstop amount
vim.o.expandtab = false -- don't covert tabs to spaces

--hide tab chars
vim.cmd("set list")
--vim.opt.listchars = { tab = "│ ", trail = "·", nbsp = "␣" }
vim.opt.listchars = { tab = "│ ", multispace = "│ ", nbsp = "␣" }

vim.cmd("set spell")
vim.cmd("set spelllang=en_au")

-- default diagnostic settings

vim.diagnostic.config({
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		border = "rounded",
		source = "if_many",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},

	--virtual_lines = { current_line = true },
	virtual_lines = false,

	virtual_text = {
		-- current_line is a filter.  Leave alone to have it always show on all lines.
		-- current_line = false,
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})
