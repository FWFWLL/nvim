local status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

nvim_autopairs.setup({
	disable_filetype = {
		"TelescopePrompt",
	},
	check_ts = true,
	fast_wrap = {},
})

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local handlers = require("nvim-autopairs.completion.handlers")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({
	filetypes = {
		["*"] = {
			["("] = {
				kind = {
					cmp.lsp.CompletionItemKind.Function,
					cmp.lsp.CompletionItemKind.Method,
				},
				handler = handlers["*"]
			},
		},
	},
}))
