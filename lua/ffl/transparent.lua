local status_ok, transparent = pcall(require, "transparent")
if not status_ok then
	return
end

transparent.setup {
	enable = true,
	extra_groups = {
		"Pmenu",
		"VertSplit",
		"Error",
		"DiffAdd",
		"DiffChange",
		"DiffDelete",
		"GitSignsAdd",
		"GitSignsAddInline",
		"GitSignsAddLnInline",
		"GitSignsChange",
		"GitSignsChangeInline",
		"GitSignsChangeLnInline",
		"GitSignsDelete",
		"GitSignsDeleteInline",
		"GitSignsDeleteLnInline",
	},
}
