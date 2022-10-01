local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

null_ls.setup {
	debug = false,
	sources = {
		code_actions.eslint,
		formatting.astyle,
	}
}
