require("ffl.options")
require("ffl.lazy")

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("ffl.autocommands")
		require("ffl.keymaps")

		-- Disable that pesky auto-comment on newline
		vim.cmd("set formatoptions-=cro")
	end,
})
