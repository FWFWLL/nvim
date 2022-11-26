local status_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

ts_configs.setup {
	ensure_installed = "all",
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = false,
	},
}
