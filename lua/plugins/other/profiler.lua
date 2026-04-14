local leader = Leader_other .. "P"

local profile_off = true

local function toggle_profiling()
	profile_off = not profile_off
end

vim.api.nvim_create_user_command("ToggleProfiling", toggle_profiling, {})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.keymap.set("n", leader, "<cmd>ToggleProfiling<cr>", { desc = "Toggle Redraw [P]rofiling" })
	end,
})

local start_time = 0

-- Mark the beginning of the "Thought" process
vim.on_key(function()
	if profile_off then
		return
	end

	if start_time == 0 then
		start_time = vim.loop.hrtime()
	end
end)

-- Mark the end of the "Draw" process
vim.api.nvim_create_autocmd({ "SafeState" }, {
	callback = function()
		if profile_off then
			return
		end

		if start_time > 0 then
			local duration = (vim.loop.hrtime() - start_time) / 1e6
			-- Only print if it's a significant event (prevents flooding)
			if duration > 0.1 then
				vim.notify(string.format("Last Redraw: %.2fms", duration))
			end
			start_time = 0 -- Reset for next cycle
		end
	end,
})

return {}
