-- adds extra built-in pickers for mini-pick
local leader_search = Leader_search

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("mini-extra-lsp-attach", { clear = true }),
	callback = function(event)
		local search = function(key, func, desc)
			vim.keymap.set("n", leader_search .. key, func, { buffer = event.buf, desc = desc })
		end

		local MiniExtra = require("mini.extra")

		search("s", function()
			MiniExtra.pickers.lsp({ scope = "document_symbol" })
		end, "LSP: Document [S]ymbols")
		search("S", function()
			MiniExtra.pickers.lsp({ scope = "workspace_symbol" })
		end, "LSP: Workspace [S]ymbols")
	end,
})

return {
	"nvim-mini/mini.extra",
	opts = {},
	config = function()
		local function search(key, cmd, desc)
			vim.keymap.set("n", leader_search .. key, cmd, { desc = desc })
		end

		local MiniExtra = require("mini.extra")

		search("b", MiniExtra.pickers.buf_lines, "Search Within Open [B]uffers")
		search("c", MiniExtra.pickers.colorschemes, "[C]olour Schemes")
		search("d", MiniExtra.pickers.diagnostic, "[D]iagnostics")
		search("H", MiniExtra.pickers.history, "[H]istory")
		search("k", MiniExtra.pickers.keymaps, "[K]eymaps")
		search("m", MiniExtra.pickers.marks, "[M]arks")
		search("o", MiniExtra.pickers.options, "NeoVim [O]ptions")
		search("r", MiniExtra.pickers.registers, "[R]egisters")

		vim.keymap.set("n", Leader_none .. "/", MiniExtra.pickers.buf_lines, { desc = "Search Within Open Buffers" })
		vim.keymap.set("n", Leader_none .. ".", MiniExtra.pickers.oldfiles, { desc = "Search Recent Files" })

		-- spelling
		vim.keymap.set("n", "z=", MiniExtra.pickers.spellsuggest, { desc = "[S]pelling Suggestions" })
	end,
}
