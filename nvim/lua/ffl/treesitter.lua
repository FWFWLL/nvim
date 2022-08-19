local status_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter_config.setup {
	ensure_installed = {
		"astro",
		"c",
		"cpp",
		"css",
		"fish",
		"haskell",
		"html",
		"java",
		"javascript",
		"json",
		"lua",
		"make",
		"python",
		"regex",
		"rust",
		"toml",
		"tsx",
		"typescript",
		"vim",
	},
	sync_install = false,
	ignore_install = {},
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = {},
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	}
}
