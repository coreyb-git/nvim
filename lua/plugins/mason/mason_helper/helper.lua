local mason_name = {}
local lsp_name = {}

local formatters = {
	-- Bash
	"shfmt", --Formatter: Bash, Mksh, Shell

	-- C / C++ / C# / js / json
	"clang-format", -- Formatter: C, C#, C++, JSON, Java, JavaScript

	-- HTML
	"superhtml",

	-- Lua
	"stylua",
	--might need to symlink libbfd-2.42-system.so to 2.38
	-- sudo ln -s /usr/lib/x86_64-linux-gnu/libbfd-2.42-system.so /usr/lib/x86_64-linux-gnu/libbfd-2.38-system.so

	"phpcbf", --formatter using same standard as phpcs
	--"php-cs-fixer", -- Formatter: PHP

	-- Python
	"ruff",

	-- Ruby
	"rubocop",
	"yamlfmt", -- Formatter: YAML (by Google)

	-- TOML
	"taplo",
}

local linters = {
	"shellcheck", -- Linter: Bash

	--CSS
	-- "stylelint" -- Linter: CSS, Sass, SCSS, LESS

	--HTML
	"htmlhint", -- Linter: HTML

	-- Lua
	"stylua",
	--might need to symlink libbfd-2.42-system.so to 2.38
	-- sudo ln -s /usr/lib/x86_64-linux-gnu/libbfd-2.42-system.so /usr/lib/x86_64-linux-gnu/libbfd-2.38-system.so

	--Markdown
	-- "markdownlint", -- Linter, Formatter: Markdown

	"phpcs", -- Linter: PHP. (phpcbf is a formatter using same standards).
	--"phpstan", -- Linter: PHP

	-- Python
	-- "pyright",

	-- Ruby
	"rubocop",
	"yamllint", -- Linter: YAML

	-- General writing / text
	--"codespell", -- Linter: Searches for typical typing mistakes
	--"proselint", -- Linter: Text, Markdown
	--"textlint", -- Linter: Text, Markdown
	--"typos",  -- Linter: Source code spell checker
	-- NOTE: "vale" is required when using "vale_ls" because "vale_ls" doesn't include the actual vale binary.
	"vale", -- Linter: Text, Markdown, LaTeX (fast, and can do what proselint and write-good does)
	--"write-good",  -- Linter: Markdown linter for English prose for developers
}

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

	-- C#
	use_lsp("roslyn", "roslyn_ls")

	-- "codebook", -- LSP.  (Settings go in a .config/codebook/coodebook.toml file)

	use_lsp("stylelint-lsp")

	-- "gopls",  --LSP

	-- HTML / JSON
	use_lsp("superhtml")
	use_lsp("json-lsp", "jsonls")

	--"texlab", --latex lsp

	--"ltex_plus", -- LSP: Text, Markdown, LaTeX, reStructuredText (DON'T USE.  SENDS FULL BUFFER ON EVERY KEYSTROKE)

	-- Markdown
	-- use_lsp("marksman")
	--"prosemd_ls",  -- LSP: Markdown

	use_lsp("jedi-language-server", "jedi_language_server")

	use_lsp("lua-language-server", "lua_ls")

	-- PHP
	-- Using intelephense and phpactor at the same time
	-- creates a robust setup where missing features
	-- in 1 lsp are found in the other
	-- "laravel_ls",
	--"psalm", -- LSP: PHP.  Deep static analysis.
	use_lsp("intelephense")
	use_lsp("phpactor")

	-- Python
	-- "ruff",  --Linter, Formatter, LSP
	use_lsp("pyright") -- LSP

	-- Ruby
	use_lsp("ruby-lsp", "ruby_lsp")
	use_lsp("rubocop")
	-- "solargraph", -- LSP

	-- Rust
	--"rust_analyzer", -- LSP: Rust

	-- TOML
	use_lsp("taplo")

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

M.get_formatters = function()
	return formatters
end

M.get_linters = function()
	return linters
end

M.get_all_mason_names = function()
	return vim.iter({
		mason_name,
		formatters,
		linters,
		{ "tree-sitter-cli" },
	})
		:flatten()
		:totable()
end

return M
