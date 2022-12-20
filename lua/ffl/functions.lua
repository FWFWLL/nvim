local M = {}

function _G.ReloadConfig()
	for name, _ in pairs(package.loaded) do
		if name:match("^ffl") then
			package.loaded[name] = nil
		end
	end

	dofile(vim.env.MYVIMRC)

	---@diagnostic disable-next-line: param-type-mismatch
	local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
	vim.notify("Reloaded " .. plugins_count .. " plugins from " .. vim.fn.fnamemodify(vim.env.MYVIMRC, ":~"), vim.log.levels.INFO)
end

return M
