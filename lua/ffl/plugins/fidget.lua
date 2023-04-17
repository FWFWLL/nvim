local M = {"j-hui/fidget.nvim"}

M.event = "BufReadPost"

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, fidget = preq("fidget")
	if not status_ok then
		return
	end

	local icons = require("ffl.icons")

	fidget.setup({
		text = {
			spinner = "dots",
			done = icons.fidget.Done,
			commenced = "Commenced",
			completed = "Completed",
		},
		align = {
			bottom = true,
			right = true,
		},
		timer = {
			spinner_rate = 125, -- ms
			fidget_decay = 2000, -- ms
			task_decay = 1000, -- ms
		},
		window = {
			relative = "win",
			blend = 0,
			zindex = nil,
			border = "rounded",
		},
	})
end

return M

