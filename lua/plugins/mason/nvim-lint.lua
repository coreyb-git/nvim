local leader = Leader_other_writing

local text_linters = {
	--"markdownlint",
	--"proselint",
	--"textlint",
	--"write-good",
	--"codespell",
	"vale",
}

return {
	{
		"mfussenegger/nvim-lint",

		name = "lint",

		dependencies = "WhoIsSethDaniel/mason-tool-installer.nvim",

		--event = { "BufReadPre", "BufNewFile" },

		keys = {
			{
				leader .. "R",
				function()
					vim.diagnostic.reset(nil, 0)
				end,
				desc = "[R]eset diagnostics for current buffer",
			},
			{
				leader .. "l",
				function()
					-- Trigger manual text linting
					require("lint").try_lint(text_linters)
				end,
				desc = "Text [l]int manually",
			},
		},

		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				--css = { "stylelint_lsp" },
				asciidoc = text_linters,
				--asciidoctor = { "vale" },
				html = { "htmlhint" },
				--markdown = { "markdownlint", "vale" },
				--markdown = { "markdownlint" },
				--markdown = { "write-good", "textlint" },
				text = text_linters,
				--asciidoc = { "codespell", "vale" },
				--php = { "phpcs", "phpstan" },
				php = { "phpcs" },
				python = { "ruff" },
				ruby = { "rubocop" },
				sh = { "shellcheck" },
				yaml = { "yamllint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			--local events = { "BufEnter", "InsertLeave", "TextChanged" }
			local events = { "BufReadPost", "BufWritePost" }
			vim.api.nvim_create_autocmd(events, {
				group = lint_augroup,
				callback = function()
					vim.schedule(function()
						if vim.opt_local.modifiable:get() then
							vim.notify("Linting")
							lint.try_lint()
						end
					end)
				end,
			})
		end,
	},
}
