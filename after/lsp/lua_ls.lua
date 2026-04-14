return {
	-- cmd = { ... },
	-- filetypes = { ... },
	-- capabilities = {},
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
				library = {
					-- This is to implement what lazydev was doing since lua_ls has a race condition now
					-- that prevents lazydev from injecting the settings.
					vim.env.VIMRUNTIME,
					vim.fn.stdpath("config") .. "/lua",
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
			diagnostics = {
				globals = {
					"vim", -- silence the warning about unknown vim objects
				},
			},
			completion = {
				--callSnippet = "Replace",
			},
			-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
			-- diagnostics = { disable = { 'missing-fields' } },
		},
	},
}
