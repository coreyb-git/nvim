return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = "mason-org/mason.nvim",
	config = function()
		local helper = require("plugins.mason.mason_helper.helper")
		local tool = require("mason-tool-installer")
		local mason_names = helper.get_all_mason_names()
		tool.setup({ ensure_installed = mason_names })
	end,
}
