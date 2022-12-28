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

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	vim.notify([[require("lazy") FAILED]], vim.log.levels.WARN)
	return
end

lazy.setup("ffl.plugins", {
	defaults = {
		lazy = false,
	},
	install = {
		colorscheme = {
			"catppuccin",
		},
	},
	rtp = {
		"netrwPlugin",
	},
})

vim.keymap.set("n", "<Leader>l", "<CMD>Lazy<CR>")
