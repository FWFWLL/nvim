local M = {"saifulapm/chartoggle.nvim"}

M.event = "VeryLazy"

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, chartoggle = preq("chartoggle")
	if not status_ok then
		return
	end

	chartoggle.setup({
		leader = "<LocalLeader>",
		keys = {
			",",
			";",
		},
	})
end

return M
