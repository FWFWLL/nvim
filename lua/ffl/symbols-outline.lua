local status_ok, symbols_outline = pcall(require, "symbols-outline")
if not status_ok then
	return
end

local icons = require("ffl.icons")

symbols_outline.setup {
	highlight_hovered_items = true,
	show_guides = false,
	auto_preview = false,
	positions = "right",
	relative_width = true,
	width = 25,
	auto_close = false,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	preview_bg_highlight = "Pmenu",
	autofold_depth = nil,
	auto_unfold_hover = true,
	fold_markers = {
		icons.ui.ArrowClosed,
		icons.ui.ArrowOpen,
	},
	wrap = false,
	keymaps = {
		close = {"<ESC>", "q"},
		goto_location = "<CR>",
		focus_location = "o",
		toggle_preview = "K",
		rename_symbol = "r",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = {icon = icons.documents.File, hl = "CmpItemKindFile"},
		Module = {icon = icons.kind.Module, hl = "CmpItemKindModule"},
		Namespace = {icon = icons.kind.Module, hl = "CmpItemKindModule"},
		Package = {icon = icons.kind.Module, hl = "CmpItemKindModule"},
		Class = {icon = icons.kind.Class, hl = "CmpItemKindClass"},
		Method = {icon = icons.kind.Method, hl = "CmpItemKindMethod"},
		Property = {icon = icons.kind.Property, hl = "CmpItemKindProperty"},
		Field = {icon = icons.kind.Field, hl = "CmpItemKindField"},
		Constructor = {icon = icons.kind.Constructor, hl = "CmpItemKindConstructor"},
		Enum = {icon = icons.kind.Enum, hl = "CmpItemKindEnum"},
		Interface = {icon = icons.kind.Interface, hl = "CmpItemKindInterface"},
		Function = {icon = icons.kind.Function, hl = "CmpItemKindFunction"},
		Variable = {icon = icons.kind.Variable, hl = "CmpItemKindVariable"},
		Constant = {icon = icons.kind.Constant, hl = "CmpItemKindConstant"},
		String = {icon = icons.type.String, hl = "TSString"},
		Number = {icon = icons.type.Number, hl = "TSNumber"},
		Boolean = {icon = icons.type.Boolean, hl = "TSBoolean"},
		Array = {icon = icons.type.Array, hl = "TSKeyword"},
		Object = {icon = icons.type.Object, hl = "TSKeyword"},
		Key = {icon = icons.kind.Keyword, hl = "CmpItemKeyword"},
		Null = {icon = "NULL", hl = "TSKeyword"},
		EnumMember = {icon = icons.kind.EnumMember, hl = "CmpItemKindEnumMember"},
		Struct = {icon = icons.kind.Struct, hl = "CmpItemKindStruct"},
		Event = {icon = icons.kind.Event, hl = "CmpItemKindEvent"},
		Operator = {icon = icons.kind.Operator, hl = "CmpItemKindOperator"},
		TypeParameter = {icon = icons.kind.TypeParameter, hl = "CmpItemKindTypeParameter"},
	},
}
