local M = {"numToStr/Comment.nvim"}

M.event = "VeryLazy"

function M.config()
	local f = require("ffl.functions")

	local status_ok, comment = f.preq("Comment")
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
