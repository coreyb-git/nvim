return {
	settings = {
		["csharp|inlay_hints"] = {
			csharp_enable_inlay_hints_for_implicit_object_creation = true,
			cshapr_enable_inlay_hints_for_implicit_variable_types = true,
		},
		["csharp|code_lens"] = {
			dotnet_enable_references_code_lens = false,
			dotnet_enable_tests_code_lens = false,
		},
		["csharp|background_analysis"] = {
			dotnet_compiler_diagnostics_scope = "openFiles",
			dotnet_analyzer_diagnostics_scope = "openFiles",
		},
		["csharp|completion"] = {
			dotnet_provide_regex_completions = false,
			dotnet_show_completion_items_from_unimported_namespaces = false,
			dotnet_show_name_completion_suggestions = false,
		},
		["csharp|symbol_search"] = {
			dotnet_search_reference_assemblies = false,
		},
	},
}
