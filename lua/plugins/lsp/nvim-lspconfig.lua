local leader = "gr" -- normal mode binds
local leader_toggle = Leader_ui .. "l" -- /UI/LSP/
local leader_toggle_inlay = leader_toggle .. "H"
local leader_toggle_diagnostics = leader_toggle .. "D"

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- Bind LspInfo and LspLog commands
		vim.api.nvim_create_user_command("LspInfo", function()
			vim.cmd("checkhealth vim.lsp")
		end, { force = true, desc = "checkhealth vim.lsp" })

		vim.api.nvim_create_user_command("LspLog", function()
			vim.cmd.edit(vim.lsp.log.get_filename())
		end, { force = true, desc = "checkhealth vim.lsp" })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lspconfig-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
				end

				map(leader, "", "LSP")

				-- Rename the variable under your cursor.
				--  Most Language Servers support renaming across files, etc.
				map(leader .. "n", vim.lsp.buf.rename, "Re[n]ame")

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				map(leader .. "a", vim.lsp.buf.code_action, "Code [A]ctions", { "n", "x" })

				-- Find references for the word under your cursor.
				--map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map(leader .. "r", vim.lsp.buf.references, "Goto [R]eferences")

				-- Jump to the implementation of the word under your cursor.
				--  Useful when your language has ways of declaring types without an actual implementation.
				--map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map(leader .. "i", vim.lsp.buf.implementation, "Goto [I]mplementation")

				-- Jump to the definition of the word under your cursor.
				--  This is where a variable was first declared, or where a function is defined, etc.
				--  To jump back, press <C-t>.
				--map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map(leader .. "t", vim.lsp.buf.type_definition, "Goto Type [D]efinition")

				map(leader .. "d", vim.lsp.buf.definition, "Goto [D]efinition")

				-- WARN: This is not Goto Definition, this is Goto Declaration.
				--  For example, in C this would take you to the header.
				map(leader .. "D", vim.lsp.buf.declaration, "Goto [D]eclaration")

				-- Toggles
				map(leader_toggle, "", "LSP")

				map(leader_toggle_diagnostics, function()
					vim.diagnostic.enable(not vim.diagnostic.is_enabled())
					vim.diagnostic.reset(event.buf)
				end, "Toggle LSP [D]iagnostics")
				map(leader_toggle_inlay, function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, "Toggle LSP Inlay [H]ints")

				-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
				local function client_supports_method(client, method, bufnr)
					return client:supports_method(method, bufnr)
				end

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if
					client
					and client_supports_method(
						client,
						vim.lsp.protocol.Methods.textDocument_documentHighlight,
						event.buf
					)
				then
					local highlight_augroup = vim.api.nvim_create_augroup("lspconfig-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lspconfig-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lspconfig-lsp-highlight", buffer = event2.buf })
						end,
					})
				end
			end,
		})
		--[[
		require("mason").setup({
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
		})
		]]
		--

		local helper = require("plugins.lsp.lsp_helper.lsp_helper")
		local tool = require("mason-tool-installer")
		tool.setup({ ensure_installed = helper.get_mason_names() })

		local lsp_names = helper.get_lsp_names()
		-- Enable servers
		for _, server in ipairs(lsp_names) do
			vim.lsp.enable(server)
		end

		-- Disable stylua lsp in favour of lua_ls
		vim.lsp.enable("stylua", false)

		vim.lsp.inlay_hint.enable(true)
	end,
}
