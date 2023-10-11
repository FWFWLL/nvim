local M = {"saecki/crates.nvim"}

M.dependencies = "nvim-lua/plenary.nvim"

M.event = "BufRead Cargo.toml"

M.config = function ()
	local preq = require("ffl.functions").preq

	local status_ok, crates = preq("crates")
	if not status_ok then
		return
	end

	crates.setup({
		src = {
			cmp = {
				enabled = true,
			},
		},
	})
end

return M
