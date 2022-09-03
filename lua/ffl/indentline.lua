local g = vim.g

local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

g.indentLine_enabled = 1
g.indent_blankline_char = "⁞"
g.indent_blankline_show_trailing_blackline_indent = false
g.indent_blankline_show_first_indent_level = true
g.indent_blankline_use_treesitter = false
g.indent_blankline_show_current_context = true

g.indent_blankline_buftype_exclude = {
	"terminal",
	"nofile",
}

g.indent_blankline_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
	"text",
	"TelescopePrompt",
}

indent_blankline.setup {
	show_current_context = true,
}
