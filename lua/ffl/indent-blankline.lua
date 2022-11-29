local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

local icons = require("ffl.icons")

indent_blankline.setup({
	char = icons.ui.IndentChar,
	use_treesitter = true,
	show_first_indent_level = true,
	show_trailing_blankline_indent = true,
	show_current_context = true,
	filetype_exclude = {
		"help",
		"checkhealth",
		"packer",
		"NvimTree",
	},
	buftype_exclude = {
		"terminal",
		"prompt",
		"nofile",
	},
})
