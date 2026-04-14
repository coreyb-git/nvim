-- Leader menu settings
Leader_none = "<leader>"
Leader_debug = "<leader>d"
Leader_git = "<leader>g"
Leader_other = "<leader>o"
Leader_other_writing = Leader_other .. "w"
Leader_search = "<leader>s"
Leader_search_telescope = Leader_search .. "t"
Leader_ui = "<leader>u"
Leader_windows = "<leader>w"
Leader_windows_fileexplorers = Leader_windows .. "e"

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
--vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
--vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
--vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
--vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

----

--vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")

vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })
--vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })

--show diagnostics float
--[[vim.keymap.set(
	"n",
	"<leader>d",
	vim.diagnostic.open_float,
	{ noremap = true, silent = true, desc = "[d]iagnostic Float" }
)
]]
--

--word wrap nav
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

--shift left/right buffer nav
vim.keymap.set("n", "<S-h>", "<Cmd>bp<CR>", { noremap = true, silent = true, desc = "buffer next" })
vim.keymap.set("n", "<S-l>", "<Cmd>bn<CR>", { noremap = true, silent = true, desc = "buffer previous" })

--control up/down/left/right window nav
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "window up" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "window right" })
vim.keymap.set("n", "<C-q>", "<C-w><C-q>", { noremap = true, silent = true, desc = "window close" })

--resize windows
vim.keymap.set("n", "<C-Up>", "<C-w>+", { noremap = true, silent = true, desc = "win height +" })
vim.keymap.set("n", "<C-Down>", "<C-w>-", { noremap = true, silent = true, desc = "win height -" })
vim.keymap.set("n", "<C-Left>", "<C-w><", { noremap = true, silent = true, desc = "win width -" })
vim.keymap.set("n", "<C-Right>", "<C-w>>", { noremap = true, silent = true, desc = "win width +" })

-- exit insert mode when in terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n><CR>", { noremap = true, silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-n><CR>", { noremap = true, silent = true })

-- cursorline toggle
local leader = "<leader>uc"

vim.keymap.set("n", leader, function() end, { desc = "[C]ursorline Guide" })
vim.keymap.set("n", leader .. "e", "<cmd>set cursorline<cr>", { desc = "[E]nable" })
vim.keymap.set("n", leader .. "d", "<cmd>set nocursorline<cr>", { desc = "[D]isable" })

-- indent guide toggle
local leader = "<leader>ui"

vim.keymap.set("n", leader, function() end, { desc = "[I]ndent Guide" })
vim.keymap.set("n", leader .. "e", "<cmd>set list<cr>", { desc = "[E]nable" })
vim.keymap.set("n", leader .. "d", "<cmd>set nolist<cr>", { desc = "[D]isable" })
