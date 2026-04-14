--lazy shortcut
vim.keymap.set("n", "<leader>P", function() end, { desc = "[P]lugin Manager", noremap = true, silent = true })
vim.keymap.set("n", "<leader>Pl", "<Cmd>Lazy<CR>", { desc = "[L]azy", noremap = true, silent = true })

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    This is the easiest way to modularize your config.
	--
	--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	{ import = "plugins" },
	{ import = "plugins/dev" },
	{ import = "plugins/formatting" },
	{ import = "plugins/lsp" },
	{ import = "plugins/lsp/lsp_configs" },
	{ import = "plugins/other" },
	{ import = "plugins/popups" },
	{ import = "plugins/ui" },
	{ import = "plugins/windows" },
}, {
	dev = {
		path = "~/Documents/dev/nvim_plugins/",
	},

	checker = {
		enabled = true, -- check for plugin updates periodically
		check_pinned = true,
		notify = true, --false, -- notify on update
		frequency = 86400,
	},
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
