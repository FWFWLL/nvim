local colorscheme = "molokai"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

local colors = {
	bg = "#1C1C1C",
	aquamarine = "#54DA97",
	black = "#111111",
	gray = "#777777",
	white = "#EEEEEE",
	red = "#F92672",
	blue = "#66D9EF",
	carmine = "#FF0064",
	yellow = "#FFF26D",
	lime = "#D7FF00",
	navy = "#00005F",
	lavender = "#AF87FF",
	cmp = {
		emoji = "#FDE030",
		crate = "#F64D00",
	},
	git = {
		add = "#A6E22E",
		change = "#66D9EF",
		delete = "#F92672",
	},
}

-- Helper function for setting highlight groups
local function set_hl(hl_group, hl_args) vim.api.nvim_set_hl(0, hl_group, hl_args) end

-- Neovim
set_hl("LineNr", {fg = colors.white})
set_hl("CursorLineNr", {fg = colors.carmine})
set_hl("CursorLine", {bg = colors.bg})
set_hl("TabLine", {bg = colors.bg})
set_hl("VertSplit", {bg = colors.bg})
set_hl("StatusLine", {fg = colors.bg})

-- Nvim-cmp --
-- Abbr
set_hl("CmpItemAbbr", {fg = colors.white})
set_hl("CmpItemAbbrMatch", {fg = colors.carmine})
set_hl("CmpItemAbbrMatchFuzzy", {fg = colors.red})

-- Kind
set_hl("CmpItemKindDefault", {fg = colors.gray})
set_hl("CmpItemKindVariable", {fg = colors.blue})
set_hl("CmpItemKindInterface", {fg = colors.blue})
set_hl("CmpItemKindText", {fg = colors.blue})
set_hl("CmpItemKindField", {fg = colors.blue})
set_hl("CmpItemKindClass", {fg = colors.yellow})
set_hl("CmpItemKindConstructor", {fg = colors.yellow})
set_hl("CmpItemKindModule", {fg = colors.yellow})
set_hl("CmpItemKindStruct", {fg = colors.yellow})
set_hl("CmpItemKindEnum", {fg = colors.yellow})
set_hl("CmpItemKindTypeParameter", {fg = colors.yellow})
set_hl("CmpItemKindEnumMember", {fg = colors.yellow})
set_hl("CmpItemKindFunction", {fg = colors.red})
set_hl("CmpItemKindMethod", {fg = colors.red})
set_hl("CmpItemKindSnippet", {fg = colors.lavender})
set_hl("CmpItemKindKeyword", {fg = colors.white})
set_hl("CmpItemKindProperty", {fg = colors.white})
set_hl("CmpItemKindUnit", {fg = colors.white})
set_hl("CmpItemKindConstant", {fg = colors.white})
set_hl("CmpItemKindReference", {fg = colors.white})
set_hl("CmpItemKindOperator", {fg = colors.white})
set_hl("CmpItemKindEmoji", {fg = colors.cmp.emoji})
set_hl("CmpItemKindCrate", {fg = colors.cmp.crate})

-- Nvim-tree
set_hl("NvimTreeOpenedFile", {fg = colors.aquamarine})

-- Telescope
set_hl("TelescopeMatching", {fg = colors.carmine})
set_hl("TelescopePromptPrefix", {fg = colors.carmine})

-- Gitsigns
set_hl("GitSignsAdd", {fg = colors.git.add})
set_hl("GitSignsChange", {fg = colors.git.change})
set_hl("GitSignsDelete", {fg = colors.git.delete})

-- Alpha
set_hl("DashboardHeader", {fg = colors.carmine})
set_hl("DashboardFooter", {fg = colors.aquamarine})
