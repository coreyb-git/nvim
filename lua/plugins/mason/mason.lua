local leader = Leader_windows .. "m"

-- Add Mason's bin directory to PATH
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

return {
	"mason-org/mason.nvim",
	opts = {
		registries = {
			"github:mason-org/mason-registry",
			"github:Crashdummyy/mason-registry", -- enables Roslyn C# LSP
		},
	},
	keys = {
		{ leader, "<cmd>Mason<cr>", desc = "[M]ason" },
	},
}
