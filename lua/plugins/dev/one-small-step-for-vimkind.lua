local function osv_disconnect()
	local osv = require("osv")
	if osv.is_running() then
		vim.notify("Attempting to stop existing OSV instance")
		osv.stop() -- Attempt to kill the old server first
		vim.wait(2000) -- Give the OS a millisecond to release the port
	end
end

vim.api.nvim_create_autocmd("VimLeave", { -- perform only once on loading
	callback = function()
		osv_disconnect()
	end,
})

--[[
Quickstart

    Launch the server in the debuggee using <leader>dl
    Open another Neovim instance with the source file
    Place breakpoint with <leader>db
    Connect using the DAP client with <leader>dc
    Run your script/plugin in the debuggee

--]]

local leader = Leader_debug .. "n"

return {
	"jbyuki/one-small-step-for-vimkind",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	lazy = false,
	keys = {
		{ leader, function() end, desc = "NVim plugin debug (OSV)" },

		{
			leader .. "l",
			function()
				local osv = require("osv")
				osv_disconnect()
				local result = osv.launch({ port = 8086, frozen_delay = 100 })
				if nil then
					vim.notify("OSV could not be started!")
				else
					vim.notify("OSV server should now be running.")
				end
			end,
			desc = "[L]aunch",
		},

		{

			leader .. "w",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.hover()
			end,
			desc = "[W]idgets Hover",
		},

		{

			leader .. "f",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end,
			desc = "[F]rames",
		},
	},

	config = function()
		-- Put the suggested configuration here
		local dap = require("dap")
		dap.configurations.lua = {
			{
				type = "nlua",
				request = "attach",
				name = "Attach to running Neovim instance",
				stopOnEntry = true,
			},
		}

		dap.adapters.nlua = function(callback, config)
			callback({
				type = "server",
				host = config.host or "127.0.0.1",
				port = config.port or 8086,
			})
		end
	end,
}
