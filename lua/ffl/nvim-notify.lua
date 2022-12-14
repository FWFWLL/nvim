local status_ok, nvim_notify = pcall(require, "notify")
if not status_ok then
	return
end

local icons = require("ffl.icons")

nvim_notify.setup({
	fps = 30,
	background_colour = "Normal",
	icons = {
		TRACE = icons.ui.Pencil,
		DEBUG = icons.ui.Bug,
		INFO = icons.diagnostics.Information,
		WARN = icons.diagnostics.Warning,
		ERROR = icons.diagnostics.Error,
	},
	level = vim.log.levels.TRACE,
	minimum_width = 0,
	render = "minimal",
	stages = "fade",
	timeout = 2000,
	top_down = true,
})

vim.notify = nvim_notify

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

telescope.load_extension("notify")
