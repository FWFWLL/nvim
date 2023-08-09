local M = {"L3MON4D3/LuaSnip"}

M.lazy = true
M.dependencies = {
	"rafamadriz/friendly-snippets",
}

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, luasnip = preq("luasnip")
	if not status_ok then
		return
	end

	require("luasnip.loaders.from_vscode").lazy_load()

	luasnip.config.setup({
		history = true,
		enable_autosnippets = true,
	})
end

return M

