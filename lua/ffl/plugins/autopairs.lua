local M = {"windwp/nvim-autopairs"}

M.event = "InsertEnter"

function M.config()
	local f = require("ffl.functions")

	local status_ok, autopairs = f.preq("nvim-autopairs")
	if not status_ok then
		return
	end

	autopairs.setup({
		disable_filetype = {
			"TelescopePrompt",
		},
		check_ts = true,
	})
end

return M
