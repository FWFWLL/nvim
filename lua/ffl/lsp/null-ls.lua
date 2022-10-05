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
		formatting.astyle.with {
			extra_args = {
				"-A2",
				"-t4",
				"-xn",
				"-C",
				"-p",
				"-xg",
				"-U",
				"-k1",
				"-W1",
				"-z2",
				"-O",
				"-o",
			},
		},
	}
}
