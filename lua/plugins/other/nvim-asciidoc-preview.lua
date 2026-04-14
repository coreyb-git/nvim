-- other/writing/asciidoc
local leader = Leader_other_writing .. "a"

return {
	"tigion/nvim-asciidoc-preview",

	name = "asciidoc-preview",

	ft = { "asciidoc", "asciidoctor" },
	keys = {
		{ leader, "", desc = "AsciiDoc", ft = "asciidoc" },
		{ leader .. "p", "<cmd>AsciiDocPreview<cr>", mode = { "n" }, desc = "AsciiDoc [P]review", ft = "asciidoc" },
	},
	opts = {
		server = {
			--converter = 'asciidoctor -r asciidoctor-mathematical -a mathematical-format=svg $(ADOC_ROOT) -o $(BUILD_DIR)/book.html
			--converter = "cmd",
		},
		preview = {
			--position = 'current', -- current scroll position
			--position = 'start', --start of page
			position = "sync", --experimental.  same as nvim location
		},
	},
}
