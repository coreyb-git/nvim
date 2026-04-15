-- Formatter

local mason_formatters = {
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
	-- "pyright",
	"ruff",

	-- Ruby
	"rubocop",
	"yamlfmt", -- Formatter: YAML (by Google)
}

-- Autoformatter
return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local tool = require("mason-tool-installer")
			tool.setup({ ensure_installed = mason_formatters })
		end,
	},

	{
		"stevearc/conform.nvim",
		dependencies = {},
		keys = {
			{
				Leader_none .. "f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			format_on_save = {
				--timeout_ms = 5000,
				lsp_format = "fallback",
			},

			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				cs = { "clang-format" },
				c_sharp = { "clang-format" },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				-- You can use 'stop_after_first' to run the first available formatter from the list
				-- javascript = { "prettierd", "prettier", stop_after_first = true },
				--php = { "php-cs-fixer" },
				html = { "superhtml" },
				javascript = { "clang-format" },
				JSON = { "clang-format" },
				lua = { "stylua" },
				php = { "phpcbf" },
				python = { "ruff" },
				ruby = { "rubocop" },
				sh = { "shfmt" },
				yaml = { "yamlfmt" },
			},

			-- settings for each formatter
			formatters = {
				["clang-format"] = {
					prepend_args = { "--style={BasedOnStyle: Chromium}" },
				},

				-- install: composer require --dev friendsofphp/php-cs-fixer
				["php-cs-fixer"] = {
					command = "php-cs-fixer",
					args = {
						"fix",
						"--rules=@PSR12",
						"$FILENAME",
					},
					stdin = false,
				},
			},

			notify_on_error = true,
		},
	},
}
