local status_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

ts_configs.setup {
	ensure_installed = "all",
	sync_install = false,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
	},
	autopairs = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = {},
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	auto_tag = {
		enable = true,
		disable = {},
	},
	playground = {
		enable = true,
	},
}
