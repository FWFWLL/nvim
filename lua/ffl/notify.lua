local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

local icons = require("ffl.icons")

notify.setup {
	stages = "slide",
	on_open = nil,
	on_close = nil,
	render = "minimal",
	minimum_width = 10,
	icons = {
		ERROR = icons.diagnostics.Error,
		WARN = icons.diagnostics.Warning,
		INFO = icons.diagnostics.Information,
		DEBUG = icons.ui.Bug,
		TRACE = icons.ui.Pencil,
	},
}

vim.notify = notify

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

telescope.load_extension("notify")
