local status_ok, transparent = pcall(require, "transparent")
if not status_ok then
	return
end

transparent.setup {
	enable = true,
	extra_groups = {
		"Pmenu",
		"VertSplit",
		"DiffAdd",
		"DiffDelete",
		"GitSignsAddInline",
		"GitSignsAddLnInline",
		"GitSignsDeleteInline",
		"GitSignsDeleteLnInline",
	}
}
