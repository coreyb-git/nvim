local mason_dap = {
	"debugpy",         -- DAP: Python
	"js-debug-adapter", -- DAP: javascript
	"netcoredbg",      --DAP: .NET, C#, F#

	--	"delve", -- DAP: Go
	["php-debug-adapter"] = {}, -- DAP: PHP
}

return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		-- Installs the debug adapters for you
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("mason-nvim-dap").setup({
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_installation = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = mason_dap,
		})
	end,
}
