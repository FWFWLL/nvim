local M = {"williamboman/mason.nvim"}

M.event = "VeryLazy"

function M.config()
	local f = require("ffl.functions")

	local mason_status_ok, mason = f.preq("mason")
	if not mason_status_ok then
		return
	end

	mason.setup({
		ui = {
			border = "rounded",
			icons = {
				-- TODO: Aggregate icons
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
		log_level = vim.log.levels.INFO,
		max_concurrent_installers = 4,
	})
end

return M
