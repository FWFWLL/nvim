local M = {"kylechui/nvim-surround"}

M.version = "*"
M.event = "VeryLazy"

function M.config()
	local f = require("ffl.functions")

	local status_ok, surround = f.preq("nvim-surround")
	if not status_ok then
		return
	end

	surround.setup({})
end

return M
