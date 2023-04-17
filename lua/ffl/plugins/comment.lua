local M = {"numToStr/Comment.nvim"}

M.event = "VeryLazy"

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, comment = preq("Comment")
	if not status_ok then
		return
	end

	comment.setup({
		padding = true,
		sticky = true,
		ignore = "^$",
		mappings = {
			basic = true,
			extra = true
		},
	})
end

return M

