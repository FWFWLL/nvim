local M = {"nvim-treesitter/nvim-treesitter"}

M.build = ":TSUpdate"
M.event = "BufReadPre"

function M.config()
	local f = require("ffl.functions")

	local status_ok, ts_configs = f.preq("nvim-treesitter.configs")
	if not status_ok then
		return
	end

	ts_configs.setup({
		ensure_installed = "all",
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
	})
end

return M
