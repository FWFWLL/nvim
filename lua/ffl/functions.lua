local M = {}

-- Check if nil
function M.empty(expr)
	return expr == nil or expr == ""
end

-- Get buffer option
function M.get_buf_option(opt)
	local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
	if not status_ok then
		return nil
	else
		return buf_option
	end
end

-- Shortened function for setting highlight groups
function M.set_hl(...)
	vim.api.nvim_set_hl(0, ...)
end

-- Capitalize first character in a string
function M.capitalize(str)
	return (str:gsub("^%l", string.upper))
end

return M
