return {
	java = {
		autobuild = { enabled = false },
		signatureHelp = { enabled = true },
		contentProvider = { preferred = "fernflower" },
		saveActions = {
			organizeImports = true,
		},
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			hashCodeEquals = {
				useJava7Objects = true,
			},
			useBlocks = true,
		},
		eclipse = {
			downloadSources = true,
		},
		configuration = {
			updateBuildConfiguration = "interactive",
			runtimes = {
				{
					name = "JavaSE-19",
					path = "~/.sdkman/candidates/java/19.0.1-open",
				},
				{
					name = "JavaSE-20",
					path = "~/.sdkman/candidates/java/20.0.2-open",
				}
			},
		},
		maven = {
			downloadSources = true,
		},
		implementationsCodeLens = {
			enabled = true,
		},
		referencesCodeLens = {
			enabled = true,
		},
		references = {
			includeDecompiledSources = true,
		},
		inlayHints = {
			parameterNames = {
				enabled = "all",
			},
		},
		format = {
			enabled = false,
		},
	},
}

