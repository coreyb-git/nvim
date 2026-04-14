return {
	"comfysage/artio.nvim",
	lazy = false,
	config = function()
		require("vim._core.ui2").enable({
			enable = true,
			msg = {
				target = "msg",
			}
		})
	end,
}
