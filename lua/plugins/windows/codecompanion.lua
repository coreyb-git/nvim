local leader = Leader_windows .. "c"

return {
	"olimorris/codecompanion.nvim",
	priority = 100,
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	-- KEYBINDINGS
	keys = {
		{ leader, "", mode = { "n", "v" }, desc = "[C]ode Companion" },
		{ leader .. "a", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "[A]ctions" },
		{ leader .. "c", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "[C]hat" },
		{ leader .. "e", "<cmd>CodeCompanion /explain<cr>", mode = "v", desc = "[E]xplain selected text" },
		{ leader .. "f", "<cmd>CodeCompanion /fix<cr>", mode = "v", desc = "[F]ix selected text" },
	},
	-- CONFIGURATION
	opts = {
		interactions = {
			chat = { adapter = "lmstudio" },
			inline = { adapter = "lmstudio" },
			agent = { adapter = "lmstudio" },
		},
		adapters = {
			http = {

				--[[lmstudio = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "http://localhost:1234",
							api_key = "lm-studio",
						},
						url = "http://localhost:1234/v1/responses",
						handlers = {
							-- This is the "secret sauce" for 2026:
							-- Manually restructuring the payload before it leaves Neovim
							form_parameters = function(self, params, messages)
								return {
									model = params.model,
									input = messages, -- This forces the 'input' field LM Studio wants
									stream = params.stream,
									--reasoning = { effort = "medium" },
								}
							end,
						},
						schema = {
							-- We nil these out so the adapter doesn't try to add them back in
							messages = { mapping = "" },
						},
					})
				end,]]
				--

				lmstudio = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "http://127.0.0.1:1234",
							api_key = "lm-studio",
							--chat_url = "/v1/responses",
							chat_url = "/v1/chat/completions",
						},
					})
				end,
			},
		},
	},
}
