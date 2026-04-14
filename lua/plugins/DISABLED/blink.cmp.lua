-- also includes blink-cmp-words for local WordNet dictionary/thesaurus

return {
	"saghen/blink.cmp",
	event = "VimEnter",
	--	enabled = false,

	dependencies = {
		"rafamadriz/friendly-snippets",
		"archie-judd/blink-cmp-words",
	},
	version = "1.*", -- causes download of pre-built binaries
	opts = {
		signature = { enabled = true },

		fuzzy = { implementation = "prefer_rust_with_warning" },

		completion = {
			accept = {
				auto_brackets = { enabled = true },
			},
			-- By default, you may press `<c-space>` to show the documentation.
			documentation = {
				--auto_show = true,
				--auto_show_delay_ms = 1000,
			},
			ghost_text = { enabled = true },
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
		},

		cmdline = {
			keymap = { preset = "cmdline" },
			completion = {
				menu = {
					auto_show = false,
				},
			},
		},

		enabled = function()
			local ignore_filetypes = {
				"markdown",
				"asciidoc",
				"asciidoctor",
			}

			return not vim.tbl_contains(ignore_filetypes, vim.bo.filetype)
				and vim.bo.buftype ~= "prompt"
				and vim.b.completion ~= false
			--			return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
		end,

		keymap = {
			preset = "default",

			-- C-space is the default to trigger the completion popup

			["<BS>"] = { "hide", "fallback" },
			["<CR>"] = { "select_and_accept", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"lazydev",
				"buffer",
				--"markdown",
			},

			providers = {
				lsp = {
					name = "LSP",
					module = "blink.cmp.sources.lsp",
					async = true,
				},

				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },

				dictionary = {
					name = "blink-cmp-words",
					module = "blink-cmp-words.dictionary",
				},
				thesaurus = {
					name = "blink-cmp-words",
					module = "blink-cmp-words.thesaurus",
				},
			},
		},
	},
}
