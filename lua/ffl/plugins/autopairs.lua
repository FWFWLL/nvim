local M = {"windwp/nvim-autopairs"}

M.event = "InsertEnter"

function M.config()
	local preq = require("ffl.functions").preq

	local status_ok, autopairs = preq("nvim-autopairs")
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
