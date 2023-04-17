local M = {"lukas-reineke/indent-blankline.nvim"}

M.event = "BufReadPost"

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, indent_blankline = preq("indent_blankline")
	if not status_ok then
		return
	end

	indent_blankline.setup({
		use_treesitter = true,
		show_first_indent_level = false,
		show_trailing_blankline_indent = false,
		show_current_context = true,
		filetype_exclude = {
			"help",
			"checkhealth",
			"NvimTree",
		},
		buftype_exclude = {
			"terminal",
			"prompt",
			"nofile",
		},
	})
end

return M

