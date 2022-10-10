local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

local icons = require("ffl.icons")

notify.setup {
	level = vim.log.levels.TRACE,
	timeout = 2000,
	max_width = nil,
	max_height = nil,
	stages = "slide",
	background_colour = "Normal",
	icons = {
		TRACE = icons.ui.Pencil,
		DEBUG = icons.ui.Bug,
		INFO = icons.diagnostics.Information,
		WARN = icons.diagnostics.Warning,
		ERROR = icons.diagnostics.Error,
	},
	on_open = nil,
	on_close = nil,
	render = "minimal",
	minimum_width = 0,
	fps = 30,
	top_down = true,
}

local filtered_messages = {
	"warning: multiple different client offset_encodings detected for buffer, this is not supported yet",
	"LSP[jdtls] received `end` message with no corresponding `begin`",
}

vim.notify = function(msg, ...)
	for _, filtered_msg in ipairs(filtered_messages) do
		if msg == filtered_msg then
			return
		end
	end

	notify(msg, ...)
end

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

telescope.load_extension("notify")
