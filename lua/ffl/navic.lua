local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
	return
end

local icons = require("ffl.icons")

navic.setup {
	icons = {
		File = icons.kind.File .. " ",
        Module = icons.kind.Module .. " ",
        Namespace = icons.kind.Namespace .. " ",
        Package = icons.kind.Module .. " ",
        Class = icons.kind.Class .. " ",
        Method = icons.kind.Method .. " ",
        Property = icons.kind.Property .. " ",
        Field = icons.kind.Field .. " ",
        Constructor = icons.kind.Constructor .. " ",
        Enum = icons.kind.Enum .. " ",
        Interface = icons.kind.Interface .. "",
        Function = icons.kind.Function .. " ",
        Variable = icons.kind.Variable .. " ",
        Constant = icons.kind.Constant .. " ",
        Key = icons.kind.Keyword .. " ",
        EnumMember  = icons.kind.Enum .. " ",
        Struct = icons.kind.Struct .. " ",
        Event = icons.kind.Event .. " ",
        Operator = icons.kind.Operator .. " ",
        TypeParameter = icons.kind.TypeParameter .. " ",
        Array = icons.type.Array .. " ",
        String = icons.type.String .. " ",
        Number = icons.type.Number .. " ",
        Boolean = icons.type.Boolean .. " ",
        Object = icons.type.Object .. " ",
        Null = icons.type.Null .. " ",
	},
	highlight = true,
	separator = " " .. icons.ui.ChevronRight .. " ",
	depth_limit = 0,
	depth_limit_indicator = "..",
}
