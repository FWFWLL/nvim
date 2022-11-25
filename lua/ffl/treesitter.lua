local status_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

ts_configs.setup {
	ensure_installed = "all",
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autopairs = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	auto_tag = {
		enable = true,
	},
}
