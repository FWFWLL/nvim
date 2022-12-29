local M = {"neovim/nvim-lspconfig"}

M.event = "BufReadPost"
M.dependencies = {
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"folke/neodev.nvim",
}

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, _ = preq("lspconfig")
	if not status_ok then
		return
	end

	require("lspconfig.ui.windows").default_options.border = "rounded"

	require("ffl.plugins.lsp.servers").setup()
	require("ffl.plugins.lsp.diagnostics").setup()
end

return M
