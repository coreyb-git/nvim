return {
	"theHamsta/nvim-dap-virtual-text",
	event = "BufReadPost",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		require("nvim-dap-virtual-text").setup({
			all_references = true,
			virt_text_pos = "eol",
		})
	end,
}
