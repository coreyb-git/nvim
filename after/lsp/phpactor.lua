return {
	cmd = {
		"phpactor",
		"language-server",
		-- "--quiet",
	},

	on_attach = function(client, bufnr)
		--					vim.print(vim.inspect(client.server_capabilities))
		local disabled = {
			"codeActionProvider",
			"completionProvider",
			"definitionProvider",
			"documentHighlightProvider",
			"documentSymbolProvider",
			"executeCommandProvider",
			"hoverProvider",
			"implementationProvider",
			"inlineValueProvider",
			"referencesProvider",
			--"renameProvider",
			"selectionRangeProvider",
			"signatureHelpProvider",
			"typeDefinitionProvider",
			"workspaceSymbolProvider",
		}
		for _, cap in ipairs(disabled) do
			client.server_capabilities[cap] = false
		end
	end,
}
