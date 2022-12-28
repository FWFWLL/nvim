local M = {"rcarriga/nvim-notify"}

M.priority = 1000

function M.config()
	local f = require("ffl.functions")

	local status_ok, notify = f.preq("notify")
	if not status_ok then
		return
	end

	notify.setup({
		fps = 30,
		icons = {
			-- TRACE = icons.ui.Pencil,
			-- DEBUG = icons.ui.Bug,
			-- INFO = icons.diagnostics.Information,
			-- WARN = icons.diagnostics.Warning,
			-- ERROR = icons.diagnostics.Error,
		},
		level = vim.log.levels.TRACE,
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.75)
		end
		render = "minimal",
		stages = "slide",
		timeout = 2000, -- ms
		top_down = true,
	})

	vim.notify = notify
end

return M
