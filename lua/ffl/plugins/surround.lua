local M = {"kylechui/nvim-surround"}

M.version = "*"
M.event = "VeryLazy"

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, surround = preq("nvim-surround")
	if not status_ok then
		return
	end

	surround.setup({})
end

return M
