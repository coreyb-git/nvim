local buffers_text = { "asciidoc", "markdown", "text", "vimwiki" }
local buffers_code = { "cs", "json", "lua", "php", "ruby", "sh" }

-- qf are quickfix windows
-- trouble is the "trouble" plugin for finding fixme's and todo's etc.

local function default_extras()
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#ddddff" })

	vim.api.nvim_set_hl(0, "diffAdd", { fg = "#00ff00", bg = "#000000" })
	vim.api.nvim_set_hl(0, "diffChange", { fg = "#aaaaaa", bg = "#000044" })
	vim.api.nvim_set_hl(0, "diffText", { fg = "#00ff00", bg = "#004400" })
	vim.api.nvim_set_hl(0, "diffDelete", { fg = "#ff0000", bg = "#000000" })
end

local scheme_default = {
	colo = "paper",
	bg = "light",
	extras_func = default_extras,
}

local scheme_text = {
	colo = "melange",
	extras_func = default_extras,
}

local scheme_code = scheme_default

return {
	-- Default/Code
	{ "EdenEast/nightfox.nvim" },
	-- { "vague-theme/vague.nvim", opts = {} },
	--"catppuccin/nvim",
	--"lifepillar/gruvbox8",

	-- Writing
	{ "savq/melange-nvim" },
	--	{ "yorik1984/newpaper.nvim" },
	--"rebelot/kanagawa.nvim",

	{
		"yorickpeterse/vim-paper",
		--		enabled = false,
		config = function()
			local function set_colours(scheme)
				local tbl = vim.tbl_deep_extend("force", scheme_default, scheme)

				if tbl.colo ~= nil then
					vim.cmd("colo " .. tbl.colo)
				end
				if tbl.bg ~= nil then
					vim.cmd("set bg=" .. tbl.bg)
				end
				if tbl.extras_func ~= nil then
					tbl.extras_func()
				end
			end

			-- init colours
			set_colours(scheme_default)

			local function contains(tbl, val)
				for _, value in ipairs(tbl) do
					if value == val then
						return true
					end
				end
				return false
			end

			local group = vim.api.nvim_create_augroup("filetype_colours", { clear = true })
			vim.api.nvim_create_autocmd("BufEnter", { -- perform only once on loading
				nested = true, --allow ColorScheme event to also fire.
				pattern = "*",
				group = group,
				callback = function()
					local ft = vim.bo.filetype

					if vim.bo.buftype ~= "" then
						return
					end

					if contains(buffers_text, ft) then
						set_colours(scheme_text)
						return
					end

					if contains(buffers_code, ft) then
						set_colours(scheme_code)
						return
					end
				end,
			})
		end,
	},
}
