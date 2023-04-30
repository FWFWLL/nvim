local M = {"luukvbaal/statuscol.nvim"}

M.event = "BufReadPost"
M.dependencies = {"lewis6991/gitsigns.nvim"}

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, statuscol = preq("statuscol")
	if not status_ok then
		return
	end

	local builtin = require("statuscol.builtin")

	statuscol.setup({
		relculright = true,
		segments = {
			{sign = {name = {"GitSigns"}, maxwidth = 1, auto = false}},
			{sign = {name = {"Diagnostic"}, maxwidth = 1, auto = false}},
			{text = {builtin.lnumfunc, " "}},
		},
	})
end

return M

