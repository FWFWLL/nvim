local schemas = {
	{
		description = "TypeScript compiler configuration file",
		fileMatch = {"tsconfig.json", "tsconfig.*.json"},
		url = "https://json.schemastore.org/tsconfig.json",
	},
	{
		description = "ESLint config",
		fileMatch = {".eslintrc.json", ".eslintrc"},
		url = "https://json.schemastore.org/eslintrc.json",
	},
	{
		description = "NPM configuration file",
		fileMatch = {"package.json"},
		url = "https://json.schemastore.org/package.json",
	},
}

return {
	json = {
		schemas = schemas
	}
}
