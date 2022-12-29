local M = {"L3MON4D3/LuaSnip"}

M.dependencies = {
	"rafamadriz/friendly-snippets",
}

function M.config()
	local f = require("ffl.functions")

	local status_ok, luasnip = f.preq("luasnip")
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
