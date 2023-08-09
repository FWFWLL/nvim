local M = {"aserowy/tmux.nvim"}

M.lazy = false

M.config = function ()
	local preq = require("ffl.functions").preq

	local tmux_status_ok, tmux = preq("tmux")
	if not tmux_status_ok then
		return
	end

	tmux.setup({

	})
end

return M

