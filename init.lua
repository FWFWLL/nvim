require("ffl.options")
require("ffl.lazy")

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("ffl.keymaps")
	end,
})
