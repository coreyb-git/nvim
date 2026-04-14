return {
	filetypes = { "asciidoc", "markdown", "text", "gitcommit" },
	settings = {
		["harper-ls"] = {
			dialect = "Australian",
			SpellCheck = false,
			linters = {
				Dashes = false,
				SpellCheck = false,
				NoFrenchSpaces = false,
				LongSentences = false,
			},
			maxFileLength = 9999999,
		},
	},
}
