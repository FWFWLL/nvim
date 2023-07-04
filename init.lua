vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.g.neovide then
	vim.o.guifont = "ComicCodeLigatures Nerd Font:h12"

	vim.g.neovide_padding_top = 8
	vim.g.neovide_padding_bottom = 8
	vim.g.neovide_padding_right = 8
	vim.g.neovide_padding_left = 8

	vim.g.neovide_transparency = 0.8

	vim.g.neovide_scroll_animation_length = 0.5

	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_refresh_rate_idle = 5

	vim.g.neovide_fullscreen = true

	vim.g.neovide_cursor_animation_length = 0.1

	vim.g.neovide_cursor_vfx_mode = "railgun"
end

require("ffl.options")
require("ffl.lazy")

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("ffl.autocommands")
		require("ffl.keymaps")
	end,
})

