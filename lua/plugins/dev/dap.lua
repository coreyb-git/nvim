local leader_debug = Leader_none .. "d"

return {
	"mfussenegger/nvim-dap",

	name = "dap",

	dependencies = {
		-- Installs the debug adapters for you
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	keys = {
		{ leader_debug, "", desc = "[D]ebug (DAP)" },

		-- Basic debugging keymaps, feel free to change to your liking!
		{ "<F5>", "<cmd>DapContinue<cr>", desc = "Debug: Start/Continue" },
		{ "<F1>", "<cmd>DapStepInto<cr>", desc = "Debug: Step Into" },
		{ "<F2>", "<cmd>DapStepOver<cr>", desc = "Debug: Step Over" },
		{ "<F3>", "<cmd>DapStepOut<cr>", desc = "Debug: Step Out" },
		-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
		{ "<F7>", "<cmd>DapToggleREPL<cr>", desc = "Debug: See last session result." },

		{ leader_debug .. "b", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle [B]reakpoint" },
		{
			leader_debug .. "B",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Set [B]reakpoint (with condition)",
		},
		{ leader_debug .. "c", "<cmd>DapContinue<cr>", desc = "[C]onnect/continue (F5)" },
		{ leader_debug .. "i", "<cmd>DapStepInto<cr>", desc = "Step [I]nto (F1)" },
		{ leader_debug .. "o", "<cmd>DapStepOver<cr>", desc = "Step [O]ver (F2)" },
		{ leader_debug .. "O", "<cmd>DapStepOver<cr>", desc = "Step [O]out (F3)" },
	},
	config = function()
		local dap = require("dap")
		--[[
		dap.adapters.php = {
			type = "executable",
			command = "node",
			--			command = "php-debug-adapter",
			args = { vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
		}
		]]

		dap.configurations.php = {
			{
				type = "php",
				request = "launch",
				name = "Listen for Xdebug",
				port = 9003,
				pathMappings = {
					--			["/var/www/html"] = vim.fn.getcwd() .. "/", --"${workspaceFolder}",
					["/var/www/html"] = "${workspaceFolder}",
				},
			},
		}

		-- Install golang specific config
		--[[		require("dap-go").setup({
			delve = {
				-- On Windows delve must be run attached or it crashes.
				-- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
				detached = vim.fn.has("win32") == 0,
			},
		})
	]]
		--
	end,
}
