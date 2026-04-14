-- lua_ls has a race condition stopping this plugin from functioning correctly.
-- Have added code to the lsp config for lua_ls that does similar to lazydev.

-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
-- used for completion, annotations and signatures of Neovim apis
return {
	"folke/lazydev.nvim",
	lazy = false,
	opts = {
		library = {
			-- Load luvit types when the `vim.uv` word is found
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}
