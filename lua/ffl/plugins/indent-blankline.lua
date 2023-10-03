local M = {"lukas-reineke/indent-blankline.nvim"}

M.event = "BufReadPost"

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, indent_blankline = preq("ibl")
	if not status_ok then
		return
	end

	indent_blankline.setup({
		scope = {
			show_start = false,
			show_end = false,
		},
		exclude = {
			filetypes = {
				"help",
				"checkhealth",
				"NvimTree",
			},
			buftypes = {
				"terminal",
				"prompt",
				"nofile",
			},
		},
	})
end

return M

