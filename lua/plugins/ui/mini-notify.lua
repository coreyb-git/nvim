return {
	"nvim-mini/mini.notify",
	lazy = false,
	priority = 1000,
	keys = {
		{
			Leader_none .. "n",
			function()
				require("mini.notify").show_history()
			end,
			desc = "Show [N]otification History",
		},
	},
	config = function()
		require("mini.notify").setup()
	end,
}
