local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.runtimepath:prepend(lazypath)

local preq = require("ffl.functions").preq

local status_ok, lazy = preq("lazy")
if not status_ok then
	vim.notify([[require("lazy") FAILED]], vim.log.levels.WARN)
	return
end

-- TODO: Import multiple modules, ex: plugins, plugins.lsp
lazy.setup({
	spec = {
		{import = "ffl.plugins"},
		{import = "ffl.lsp"},
	},
	defaults = {
		lazy = false,
	},
	install = {
		missing = true,
		colorscheme = {"catppuccin"},
	},
	ui = {
		border = "rounded",
		icons = {},
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"netrwPlugin",
			},
		},
	}
})

vim.keymap.set("n", "<Leader>l", "<CMD>Lazy<CR>")

