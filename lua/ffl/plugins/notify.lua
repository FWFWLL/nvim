local M = {"rcarriga/nvim-notify"}

M.event = "VeryLazy"

M.config = function()
	local preq = require("ffl.functions").preq
	local icons = require("ffl.icons")

	local status_ok, notify = preq("notify")
	if not status_ok then
		return
	end

	notify.setup({
		fps = 24,
		icons = {
			TRACE = icons.ui.Pencil,
			DEBUG = icons.ui.Bug,
			INFO = icons.diagnostics.Information,
			WARN = icons.diagnostics.Warning,
			ERROR = icons.diagnostics.Error,
		},
		level = vim.log.levels.TRACE,
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.75)
		end,
		minimum_width = 0, -- Fit to content
		render = "minimal",
		stages = "slide",
		timeout = 2000, -- ms
		top_down = true,
	})

	vim.notify = notify
end

return M

