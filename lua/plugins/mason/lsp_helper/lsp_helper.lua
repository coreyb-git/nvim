local mason_name = {}
local lsp_name = {}

local function use_lsp(mason, lsp)
	table.insert(mason_name, mason)
	if lsp == nil then
		table.insert(lsp_name, mason)
	else
		table.insert(lsp_name, lsp)
	end
end

local function setup_lsp_arrays()
	use_lsp("bash-language-server", "bashls")
	use_lsp("clangd")

	-- "codebook", -- LSP.  (Settings go in a .config/codebook/coodebook.toml file)

	use_lsp("stylelint-lsp")

	--"roslyn_ls", --LSP
	-- "gopls",  --LSP

	use_lsp("superhtml")
	use_lsp("json-lsp", "jsonls")

	--"texlab", --latex lsp

	--"ltex_plus", -- LSP: Text, Markdown, LaTeX, reStructuredText (DON'T USE.  SENDS FULL BUFFER ON EVERY KEYSTROKE)

	-- use_lsp("marksman")
	use_lsp("intelephense")
	use_lsp("phpactor")

	--"psalm", -- LSP: PHP.  Deep static analysis.

	use_lsp("jedi-language-server", "jedi_language_server")

	use_lsp("lua-language-server", "lua_ls")

	--"ruff",  --Linter, Formatter, LSP: Python

	-- PHP
	-- Using intelephense and phpactor at the same time
	-- creates a robust setup where missing features
	-- in 1 lsp are found in the other
	-- "laravel_ls",

	--"prosemd_ls",  -- LSP: Markdown

	use_lsp("ruby-lsp", "ruby_lsp")

	-- "solargraph", -- LSP
	use_lsp("rubocop")

	-- Rust
	--"rust_analyzer", -- LSP: Rust

	-- TypeScript / JavaScript
	use_lsp("typescript-language-server", "ts_ls")

	-- "vale", -- Linter: Text, Markdown, LaTeX (fast, and can do what proselint and write-good does)
	--"vale_ls", -- LSP: Text, Markdown. (REQUIRES Vale linter to be installed also)
	--YAML
	use_lsp("yaml-language-server", "yamlls")

	--	use_lsp("harper-ls", "harper_ls")
	use_lsp("typos-lsp", "typos_lsp")

	-- Some languages (like typescript) have entire language plugins that can be useful:
	--    https://github.com/pmizio/typescript-tools.nvim
	-- But for many setups, the LSP (`ts_ls`) will work just fine
	-- ts_ls = {},
end

setup_lsp_arrays()

local M = {}

M.get_mason_names = function()
	return mason_name
end

M.get_lsp_names = function()
	return lsp_name
end

return M
