local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

autopairs.setup {
	disable_filetype = {
		"TelescopePrompt",
		"spectre_panel",
	},
	disable_in_macro = false,
	disable_in_visualblock = false,
	ignored_next_char = "[%w]",
	enable_moveright = true,
	enable_afterquote = true,
	enable_check_bracket_line = true,
	enable_bracket_in_quote = true,
	enable_abbr = false,
	break_undo = false,
	check_ts = true,
	ts_config = {},
	fast_wrap = {
		map = "<M-e>",
		chars = {"{", "[", "(", '"', "'"},
		pattern = [=[[%'%"%)%>%]%)%}%,]]=],
		offset = 0,
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
}

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local handlers_autopairs = require("nvim-autopairs.completion.handlers")

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {
	filtypes = {
		["*"] = {
			["("] = {
				kind = {
					cmp.lsp.CompletionItemKind.Function,
					cmp.lsp.CompletionItemKind.Method,
				},
				handler = handlers_autopairs["*"],
			},
		},
	},
})
