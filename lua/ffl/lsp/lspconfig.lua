local M = {"neovim/nvim-lspconfig"}

M.event = "BufReadPost"

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, _ = preq("lspconfig")
	if not status_ok then
		return
	end

	require("lspconfig.ui.windows").default_options.border = "rounded"

	require("ffl.lsp.handlers.diagnostics").setup()
end

return M

