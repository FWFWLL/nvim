local M = {}

-- Shortened pcall -> require -> notify
function M.preq(module_name)
	vim.notify("Loading " .. module_name .. "...")

	local status_ok, module = pcall(require, module_name)
	if not status_ok then
		vim.notify("require(" .. module_name .. ") FAILED", vim.log.levels.WARN)
	end

	return status_ok, module
end

-- Shortened vim.keymap.set
function M.keymap(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, {noremap = true, silent = true})
end

return M
