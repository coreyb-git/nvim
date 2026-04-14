local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"williamboman/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup({})
			require("mason-tool-installer").setup({
				ensure_installed = { "harper_ls" },
			})

			-- This is where the setup call for mason-lspconfig now lives
			require("lspconfig").harper_ls.setup({
				settings = {
					["harper-ls"] = {
						checkDelay = 5000,
						checkOnType = false,
					},
				},
			})
		end,
	},
})

vim.lsp.set_log_level("debug")
