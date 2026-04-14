local leader = Leader_other .. "d"

local speed_min = 0.5
local speed_max = 5

local function get_speed()
	return math.random(speed_min, speed_max)
end

local function launch_small_farm()
	require("duck").hatch("🐕", get_speed()) -- dog
	require("duck").hatch("🐈", get_speed()) -- cat
	require("duck").hatch("🐖", get_speed()) -- pig
	require("duck").hatch("🐁", get_speed()) -- mouse
	require("duck").hatch("🐀", get_speed()) -- rat
	require("duck").hatch("🐇", get_speed()) -- rabbit
	require("duck").hatch("🐓", get_speed()) -- rooster
	require("duck").hatch("🐤", get_speed()) -- baby chick
	require("duck").hatch("🐦", get_speed()) -- bird
	require("duck").hatch("🐧", get_speed()) -- penguin
	require("duck").hatch("🦆", get_speed()) -- duck
end

local function launch_farm()
	require("duck").hatch("🐒", get_speed()) -- monkey
	require("duck").hatch("🐕", get_speed()) -- dog
	require("duck").hatch("🐩", get_speed()) -- poodle
	require("duck").hatch("🐈", get_speed()) -- cat
	require("duck").hatch("🐅", get_speed()) -- tiger
	require("duck").hatch("🐆", get_speed()) -- leopard
	require("duck").hatch("🐎", get_speed()) -- horse
	require("duck").hatch("🐂", get_speed()) -- ox
	require("duck").hatch("🐃", get_speed()) -- water buffalo
	require("duck").hatch("🐄", get_speed()) -- cow
	require("duck").hatch("🐖", get_speed()) -- pig
	require("duck").hatch("🐏", get_speed()) -- ram
	require("duck").hatch("🐑", get_speed()) -- ewe
	require("duck").hatch("🐐", get_speed()) -- goat
	require("duck").hatch("🐪", get_speed()) -- camel
	require("duck").hatch("🐫", get_speed()) -- 2-hump camel
	--require("duck").hatch("🦙", get_speed()) -- llama
	require("duck").hatch("🐘", get_speed()) -- elephant
	require("duck").hatch("🦏", get_speed()) -- rhinoceros
	require("duck").hatch("🦛", get_speed()) -- hippopotamus
	require("duck").hatch("🐁", get_speed()) -- mouse
	require("duck").hatch("🐀", get_speed()) -- rat
	require("duck").hatch("🐇", get_speed()) -- rabbit
	require("duck").hatch("🐿", get_speed()) -- chipmunk
	require("duck").hatch("🦔", get_speed()) -- hedgehog
	--require("duck").hatch("🦘", get_speed()) -- kangaroo
	--require("duck").hatch("🦡", get_speed()) -- badger
	require("duck").hatch("🦃", get_speed()) -- turkey
	require("duck").hatch("🐓", get_speed()) -- rooster
	require("duck").hatch("🐤", get_speed()) -- baby chick
	require("duck").hatch("🐦", get_speed()) -- bird
	require("duck").hatch("🐧", get_speed()) -- penguin
	require("duck").hatch("🦆", get_speed()) -- duck
	--require("duck").hatch("🦚", get_speed()) -- peacock
	--require("duck").hatch("🦜", get_speed()) -- parrot
end

return {
	"itsjunetime/duck.nvim",
	keys = {
		{ leader, "", mode = { "n" }, desc = "[D]uck" },

		{
			leader .. "f",
			function()
				launch_small_farm()
			end,
			mode = { "n" },
			desc = "Small animal [f]arm",
		},
		{
			leader .. "F",
			function()
				launch_farm()
			end,
			mode = { "n" },
			desc = "Animal [F]arm!!!",
		},
		{
			leader .. "h",
			function()
				require("duck").hatch("🦆", 0.75)
			end,
			mode = { "n" },
			desc = "Duck [h]atch",
		},
		{
			leader .. "H",
			function()
				require("duck").hatch("🦆", 0.75)
				require("duck").hatch("🦆", 0.75)
				require("duck").hatch("🦆", 0.75)
			end,
			mode = { "n" },
			desc = "Duck [H]atch 3 at a time",
		},
		{
			leader .. "c",
			function()
				require("duck").cook()
			end,
			mode = { "n" },
			desc = "Duck [c]clear",
		},
		{
			leader .. "C",
			function()
				require("duck").cook_all()
			end,
			mode = { "n" },
			desc = "Duck [C]lear all",
		},
	},
	opts = {},
}
