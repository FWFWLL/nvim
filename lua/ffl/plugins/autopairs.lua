local M = {"windwp/nvim-autopairs"}

M.event = "InsertEnter"

M.config = function()
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

	local _, cmp_autopairs = preq("nvim-autopairs.completion.cmp")
	local _, cmp = preq("cmp")

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M

