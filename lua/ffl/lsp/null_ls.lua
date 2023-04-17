local M = {"jose-elias-alvarez/null-ls.nvim"}

M.event = "BufReadPost"
M.dependencies = {"williamboman/mason.nvim"}

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, null_ls = preq("null-ls")
	if not status_ok then
		return
	end

	local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup({
		sources = {
			diagnostics.ruff,
		}
	})
end

return M

