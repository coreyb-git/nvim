local leader = "<leader>P"

local function setup_keys()
	vim.keymap.set("n", leader, function() end, { desc = "[P]lugin Manager (Vim Pack)", noremap = true, silent = true })

	vim.api.nvim_create_user_command("VimPackShowAll", function()
		--print(vim.inspect(vim.pack.get()))
		vim.pack.update(nil, { offline = true })
	end, {})

	local function get_unused()
		return vim.iter(vim.pack.get())
			:filter(function(x)
				return not x.active
			end)
			:map(function(x)
				return x.spec.name
			end)
			:totable()
	end

	vim.api.nvim_create_user_command("VimPackShowUnused", function()
		print(vim.inspect(get_unused()))
	end, {})

	vim.api.nvim_create_user_command("VimPackDeleteUnused", function()
		vim.pack.del(get_unused())
	end, {})

	vim.api.nvim_create_user_command("VimPackUpdate", function()
		vim.pack.update()
	end, {})

	local function map(key, cmd, desc)
		vim.keymap.set("n", leader .. key, cmd, { desc = desc, noremap = true, silent = true })
	end

	map("a", "<cmd>VimPackShowAll<cr>", "Show [A]ll Plugins")
	map("u", "<cmd>VimPackShowUnused<cr>", "Show [U]nused Plugins")
	map("D", "<cmd>VimPackDeleteUnused<cr>", "[D]ELETE Unused Plugins")
	map("U", "<cmd>VimPackUpdate<cr>", "[U]date Plugins")
end

setup_keys()

--if 1 == 1 then return end

local migrate = require("lazy-migrate")
migrate.set_dev_path("/home/nub/Documents/dev/nvim_plugins/")

migrate.lazy_import("plugins")
migrate.lazy_import("plugins/dev")
migrate.lazy_import("plugins/mason")
migrate.lazy_import("plugins/other")
migrate.lazy_import("plugins/popups")
migrate.lazy_import("plugins/ui")
migrate.lazy_import("plugins/windows")
