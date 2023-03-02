local M = {"windwp/nvim-ts-autotag"}

M.event = "InsertEnter"

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, autotag = preq("nvim-ts-autotag")
	if not status_ok then
		return
	end

	autotag.setup()
end

return M
