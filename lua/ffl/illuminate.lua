local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
	return
end

illuminate.configure({
	providers = {
		"lsp",
		"treesitter",
		"regex",
	},
	delay = 100,
	filetypes_denylist = {
		"NvimTree",
		"packer",
		"mason",
		"TelescopePrompt",
		"lspinfo",
	},
	under_cursor = true,
	min_count_to_highlight = 1,
})
