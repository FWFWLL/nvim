local colorscheme = "molokai"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("Colorscheme " .. colorscheme .. " not found!")
	return
end

local colors = {
	bg = "#1C1C1C",
	aquamarine = "#54DA97", -- Personal favorite
	black = "#111111",
	gray = "#777777",
	white = "#EEEEEE",
	red = "#F92672",
	blue = "#66D9EF",
	carmine = "#FF0064", -- Personal favorite
	yellow = "#FFF26D",
	lime = "#D7FF00",
	navy = "#00005F",
	lavender = "#AF87FF",
	emoji = "#FDE030",
	crate = "#F64D00",
	add = "#A6E22E",
	change = "#66D9EF",
	delete = "#960050",
}

-- Helper function for setting highlight groups
local function set_hl(...) vim.api.nvim_set_hl(0, ...) end

-- Custom Highlighting --
-- Neovim
set_hl("Normal", {fg = colors.white})
set_hl("Title", {fg = colors.aquamarine})
set_hl("LineNr", {fg = colors.white})
set_hl("CursorLineNr", {fg = colors.aquamarine})
set_hl("CursorLine", {bg = colors.bg})
set_hl("TabLine", {bg = colors.bg})
set_hl("VertSplit", {bg = colors.bg})
set_hl("StatusLine", {fg = colors.lime, bg = colors.lime})
set_hl("StatusLineNC", {fg = colors.lime, bg = colors.lime})
set_hl("DiffAdd", {fg = colors.add})
set_hl("DiffChange", {fg = colors.change})
set_hl("DiffDelete", {fg = colors.delete})
set_hl("NormalFloat", {fg = colors.white})
set_hl("Pmenu", {fg = colors.white})
set_hl("PmenuThumb", {bg = colors.lime})
set_hl("FloatTitle", {fg = colors.carmine})
set_hl("Search", {fg = colors.black, bg = colors.aquamarine})
set_hl("IncSearch", {fg = colors.black, bg = colors.aquamarine})
set_hl("Substitute", {fg = colors.white, bg = colors.carmine})

-- Packer --
set_hl("packerBreakingChange", {fg = colors.delete})
set_hl("packerStatusSuccess", {fg = colors.aquamarine})
set_hl("packerStatusFail", {fg = colors.delete})
set_hl("packerPackageName", {fg = colors.white})
set_hl("packerStatusSuccess", {fg = colors.aquamarine})
set_hl("packerOutput", {fg = colors.aquamarine})
set_hl("packerSuccess", {fg = colors.aquamarine})

-- LSP --
set_hl("LspInfoBorder", {fg = colors.white})
set_hl("LspInfoTitle", {fg = colors.carmine})
set_hl("LspInfoFiletype", {fg = colors.aquamarine})

-- Fidget
set_hl("FidgetTitle", {fg = colors.aquamarine})
set_hl("FidgetTask", {fg = colors.white})

-- Mason --
set_hl("MasonHeader", {fg = colors.navy, bg = colors.lime})
set_hl("MasonHeaderSecondary", {fg = colors.navy, bg = colors.lime})
set_hl("MasonHeading", {fg = colors.carmine})
set_hl("MasonHighlight", {fg = colors.aquamarine})
set_hl("MasonHighlightBlock", {fg = colors.navy, bg = colors.lime})
set_hl("MasonHighlightBlockBold", {fg = colors.aquamarine, bg = colors.bg})
set_hl("MasonMutedBlock", {fg = colors.gray, bg = colors.bg})

-- Nvim-cmp --
set_hl("CmpItemAbbr", {fg = colors.white})
set_hl("CmpItemAbbrMatch", {fg = colors.carmine})
set_hl("CmpItemAbbrMatchFuzzy", {fg = colors.red})
set_hl("CmpItemKind", {fg = colors.gray})
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
set_hl("CmpItemKindEmoji", {fg = colors.emoji})
set_hl("CmpItemKindCrates", {fg = colors.crate})
set_hl("CmpItemKindNPM", {fg = colors.blue})
set_hl("CmpItemMenu", {fg = colors.gray})

-- Nvim-tree
set_hl("Directory", {fg = colors.carmine})
set_hl("NvimTreeOpenedFile", {fg = colors.aquamarine})
set_hl("NvimTreeGitStaged", {fg = colors.blue})

-- Telescope
set_hl("TelescopeMatching", {fg = colors.carmine})
set_hl("TelescopePromptPrefix", {fg = colors.carmine})
set_hl("TelescopeSelection", {fg = colors.aquamarine})
set_hl("TelescopeSelectionCaret", {fg = colors.carmine})
set_hl("TelescopePromptTitle", {fg = colors.carmine})
set_hl("TelescopePreviewTitle", {fg = colors.carmine})
set_hl("TelescopeResultsTitle", {fg = colors.carmine})

-- Symbols-Outline
set_hl("FocusedSymbol", {fg = colors.aquamarine})

-- Alpha
set_hl("DashboardHeader", {fg = colors.carmine})
set_hl("DashboardFooter", {fg = colors.aquamarine})

-- Leap
set_hl("LeapLabelPrimary", {fg = colors.black, bg = colors.aquamarine})

-- Indentline
set_hl("IndentBlanklineContextChar", {fg = colors.aquamarine})

-- GitSigns
set_hl("GitSignsAdd", {fg = colors.add})
set_hl("GitSignsChange", {fg = colors.change})
set_hl("GitSignsDelete", {fg = colors.delete})

-- Navic
set_hl("NavicText", {fg = colors.aquamarine, bg = colors.bg})
set_hl("NavicSeparator", {fg = colors.aquamarine, bg = colors.bg})
set_hl("NavicIconsFile", {fg = colors.gray, bg = colors.bg})
set_hl("NavicIconsModule", {fg = colors.yellow, bg = colors.bg})
set_hl("NavicIconsNamespace", {fg = colors.white, bg = colors.bg})
set_hl("NavicIconsPackage", {fg = colors.blue, bg = colors.bg})
set_hl("NavicIconsClass", {fg = colors.yellow, bg = colors.bg})
set_hl("NavicIconsMethod", {fg = colors.red, bg = colors.bg})
set_hl("NavicIconsProperty", {fg = colors.white, bg = colors.bg})
set_hl("NavicIconsField", {fg = colors.blue, bg = colors.bg})
set_hl("NavicIconsConstructor", {fg = colors.yellow, bg = colors.bg})
set_hl("NavicIconsEnum", {fg = colors.yellow, bg = colors.bg})
set_hl("NavicIconsInterface", {fg = colors.blue, bg = colors.bg})
set_hl("NavicIconsFunction", {fg = colors.red, bg = colors.bg})
set_hl("NavicIconsVariable", {fg = colors.blue, bg = colors.bg})
set_hl("NavicIconsConstant", {fg = colors.white, bg = colors.bg})
set_hl("NavicIconsString", {fg = colors.yellow, bg = colors.bg})
set_hl("NavicIconsNumber", {fg = colors.purple, bg = colors.bg})
set_hl("NavicIconsBoolean", {fg = colors.purple, bg = colors.bg})
set_hl("NavicIconsArray", {fg = colors.white, bg = colors.bg})
set_hl("NavicIconsObject", {fg = colors.blue, bg = colors.bg})
set_hl("NavicIconsKey", {fg = colors.white, bg = colors.bg})
set_hl("NavicIconsNull", {fg = colors.purple, bg = colors.bg})
set_hl("NavicIconsEnumMember", {fg = colors.yellow, bg = colors.bg})
set_hl("NavicIconsStruct", {fg = colors.yellow, bg = colors.bg})
set_hl("NavicIconsEvent", {fg = colors.yellow, bg = colors.bg})
set_hl("NavicIconsOperator", {fg = colors.white, bg = colors.bg})
set_hl("NavicIconsTypeParameter", {fg = colors.yellow, bg = colors.bg})
