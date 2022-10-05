-- Using molokai as a base
local colorscheme = "molokai"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("Colorscheme " .. colorscheme .. " not found!")
	return
end

local colors = require("ffl.colors")
local f = require("ffl.functions")

-- Custom Highlighting --
-- Neovim
f.set_hl("Normal", {fg = colors.fg})
f.set_hl("Title", {fg = colors.aquamarine})
f.set_hl("LineNr", {fg = colors.fg})
f.set_hl("CursorLineNr", {fg = colors.aquamarine})
f.set_hl("CursorLine", {bg = colors.bg})
f.set_hl("TabLine", {bg = colors.bg})
f.set_hl("VertSplit", {bg = colors.bg})
f.set_hl("StatusLine", {fg = colors.navy, bg = colors.lime})   -- Do not set `StatusLine` and `StatusLineNC` to the same values
f.set_hl("StatusLineNC", {fg = colors.lime, bg = colors.lime}) -- Don't
f.set_hl("DiffAdd", {fg = colors.add})
f.set_hl("DiffChange", {fg = colors.change})
f.set_hl("DiffDelete", {fg = colors.delete})
f.set_hl("NormalFloat", {fg = colors.fg})
f.set_hl("Pmenu", {fg = colors.fg})
f.set_hl("PmenuThumb", {bg = colors.lime})
f.set_hl("FloatTitle", {fg = colors.carmine})
f.set_hl("Search", {fg = colors.black, bg = colors.aquamarine})
f.set_hl("IncSearch", {fg = colors.black, bg = colors.aquamarine})
f.set_hl("Substitute", {fg = colors.fg, bg = colors.carmine})
f.set_hl("MatchParen", {fg = colors.bg, bg = colors.aquamarine})

-- Packer --
f.set_hl("packerBreakingChange", {fg = colors.delete})
f.set_hl("packerStatusSuccess", {fg = colors.aquamarine})
f.set_hl("packerStatusFail", {fg = colors.delete})
f.set_hl("packerPackageName", {fg = colors.fg})
f.set_hl("packerStatusSuccess", {fg = colors.aquamarine})
f.set_hl("packerOutput", {fg = colors.aquamarine})
f.set_hl("packerSuccess", {fg = colors.aquamarine})

-- LSP --
f.set_hl("LspInfoBorder", {fg = colors.fg})
f.set_hl("LspInfoTitle", {fg = colors.carmine})
f.set_hl("LspInfoFiletype", {fg = colors.aquamarine})

-- Fidget
f.set_hl("FidgetTitle", {fg = colors.aquamarine})
f.set_hl("FidgetTask", {fg = colors.fg})

-- Mason --
f.set_hl("MasonHeader", {fg = colors.navy, bg = colors.lime})
f.set_hl("MasonHeaderSecondary", {fg = colors.navy, bg = colors.lime})
f.set_hl("MasonHeading", {fg = colors.carmine})
f.set_hl("MasonHighlight", {fg = colors.aquamarine})
f.set_hl("MasonHighlightBlock", {fg = colors.navy, bg = colors.lime})
f.set_hl("MasonHighlightBlockBold", {fg = colors.aquamarine, bg = colors.bg})
f.set_hl("MasonMutedBlock", {fg = colors.gray, bg = colors.bg})

-- Nvim-cmp --
f.set_hl("CmpItemAbbr", {fg = colors.fg})
f.set_hl("CmpItemAbbrMatch", {fg = colors.carmine})
f.set_hl("CmpItemAbbrMatchFuzzy", {fg = colors.red})
f.set_hl("CmpItemKind", {fg = colors.gray})
f.set_hl("CmpItemKindDefault", {fg = colors.gray})
f.set_hl("CmpItemKindVariable", {fg = colors.blue})
f.set_hl("CmpItemKindInterface", {fg = colors.blue})
f.set_hl("CmpItemKindText", {fg = colors.blue})
f.set_hl("CmpItemKindField", {fg = colors.blue})
f.set_hl("CmpItemKindClass", {fg = colors.yellow})
f.set_hl("CmpItemKindConstructor", {fg = colors.yellow})
f.set_hl("CmpItemKindModule", {fg = colors.yellow})
f.set_hl("CmpItemKindStruct", {fg = colors.yellow})
f.set_hl("CmpItemKindEnum", {fg = colors.yellow})
f.set_hl("CmpItemKindTypeParameter", {fg = colors.yellow})
f.set_hl("CmpItemKindEnumMember", {fg = colors.yellow})
f.set_hl("CmpItemKindFunction", {fg = colors.red})
f.set_hl("CmpItemKindMethod", {fg = colors.red})
f.set_hl("CmpItemKindSnippet", {fg = colors.lavender})
f.set_hl("CmpItemKindKeyword", {fg = colors.fg})
f.set_hl("CmpItemKindProperty", {fg = colors.fg})
f.set_hl("CmpItemKindUnit", {fg = colors.fg})
f.set_hl("CmpItemKindConstant", {fg = colors.fg})
f.set_hl("CmpItemKindReference", {fg = colors.fg})
f.set_hl("CmpItemKindOperator", {fg = colors.fg})
f.set_hl("CmpItemKindEmoji", {fg = colors.emoji})
f.set_hl("CmpItemKindCrates", {fg = colors.crate})
f.set_hl("CmpItemKindNPM", {fg = colors.blue})
f.set_hl("CmpItemMenu", {fg = colors.gray})

-- Nvim-tree
f.set_hl("Directory", {fg = colors.carmine})
f.set_hl("NvimTreeOpenedFile", {fg = colors.aquamarine})
f.set_hl("NvimTreeGitStaged", {fg = colors.blue})

-- Telescope
f.set_hl("TelescopeMatching", {fg = colors.carmine})
f.set_hl("TelescopePromptPrefix", {fg = colors.carmine})
f.set_hl("TelescopeSelection", {fg = colors.aquamarine})
f.set_hl("TelescopeSelectionCaret", {fg = colors.carmine})
f.set_hl("TelescopePromptTitle", {fg = colors.carmine})
f.set_hl("TelescopePreviewTitle", {fg = colors.carmine})
f.set_hl("TelescopeResultsTitle", {fg = colors.carmine})

-- Symbols-Outline
f.set_hl("FocusedSymbol", {fg = colors.aquamarine})

-- Alpha
f.set_hl("DashboardHeader", {fg = colors.carmine})
f.set_hl("DashboardFooter", {fg = colors.aquamarine})

-- Leap
f.set_hl("LeapLabelPrimary", {fg = colors.black, bg = colors.aquamarine})

-- Indentline
f.set_hl("IndentBlanklineContextChar", {fg = colors.aquamarine})

-- GitSigns
f.set_hl("GitSignsAdd", {fg = colors.add})
f.set_hl("GitSignsChange", {fg = colors.change})
f.set_hl("GitSignsDelete", {fg = colors.delete})

-- Navic
f.set_hl("NavicText", {fg = colors.aquamarine, bg = colors.bg})
f.set_hl("NavicSeparator", {fg = colors.aquamarine, bg = colors.bg})
f.set_hl("NavicIconsModule", {fg = colors.yellow, bg = colors.bg})
f.set_hl("NavicIconsNamespace", {fg = colors.yellow, bg = colors.bg})
f.set_hl("NavicIconsStruct", {fg = colors.yellow, bg = colors.bg})
f.set_hl("NavicIconsClass", {fg = colors.yellow, bg = colors.bg})
f.set_hl("NavicIconsConstructor", {fg = colors.yellow, bg = colors.bg})
f.set_hl("NavicIconsEnum", {fg = colors.yellow, bg = colors.bg})
f.set_hl("NavicIconsEnumMember", {fg = colors.yellow, bg = colors.bg})
f.set_hl("NavicIconsTypeParameter", {fg = colors.yellow, bg = colors.bg})
f.set_hl("NavicIconsEvent", {fg = colors.yellow, bg = colors.bg})
f.set_hl("NavicIconsObject", {fg = colors.yellow, bg = colors.bg})
f.set_hl("NavicIconsField", {fg = colors.blue, bg = colors.bg})
f.set_hl("NavicIconsInterface", {fg = colors.blue, bg = colors.bg})
f.set_hl("NavicIconsVariable", {fg = colors.blue, bg = colors.bg})
f.set_hl("NavicIconsProperty", {fg = colors.blue, bg = colors.bg})
f.set_hl("NavicIconsMethod", {fg = colors.red, bg = colors.bg})
f.set_hl("NavicIconsFunction", {fg = colors.red, bg = colors.bg})
f.set_hl("NavicIconsString", {fg = colors.lavender, bg = colors.bg})
f.set_hl("NavicIconsNumber", {fg = colors.lavender, bg = colors.bg})
f.set_hl("NavicIconsBoolean", {fg = colors.lavender, bg = colors.bg})
f.set_hl("NavicIconsNull", {fg = colors.lavender, bg = colors.bg})
f.set_hl("NavicIconsOperator", {fg = colors.lavender, bg = colors.bg})
f.set_hl("NavicIconsArray", {fg = colors.lavender, bg = colors.bg})
f.set_hl("NavicIconsConstant", {fg = colors.lavender, bg = colors.bg})
f.set_hl("NavicIconsPackage", {fg = colors.fg, bg = colors.bg})
f.set_hl("NavicIconsKey", {fg = colors.fg, bg = colors.bg})
f.set_hl("NavicIconsFile", {fg = colors.gray, bg = colors.bg})
