return {
	"seblyng/roslyn.nvim",
	lazy = false,
	dependencies = {
		"mason-org/mason.nvim",
	},

	ft = "cs",
	opts = {
		--filewatching = "off",
	},
	config = function()
		require("mason").setup({
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
		})
	end,
}
