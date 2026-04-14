return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local tool = require("mason-tool-installer")
			tool.setup({ ensure_installed = { "tree-sitter-cli" } })
		end,
	},

	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",

		lazy = false,
		branch = "main",

		build = ":TSUpdate",
		--		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
		opts = {
			autotag = { enable = true },
		},
		config = function()
			-- Init folding
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
			vim.opt.foldmethod = "expr"

			require("nvim-treesitter").install({
				"asm",
				"bash",
				"c",
				"c_sharp",
				"css",
				"desktop",
				"disassembly",
				"dockerfile",
				"diff",
				"go",
				"html",
				"javascript",
				"json",
				"json5",
				"latex",
				"lua",
				"luadoc",
				"make",
				"markdown",
				"markdown_inline",
				"latex",
				"pascal",
				"php",
				"python",
				"regex",
				"ruby",
				"rust",
				"scss",
				"query",
				"tmux",
				"twig",
				"typescript",
				"vim",
				"vimdoc",
				"vue",
				"yaml",
			})
		end,
	},
}
