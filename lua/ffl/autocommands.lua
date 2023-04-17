-- Highlight yanked text
vim.api.nvim_create_autocmd({"TextYankPost"}, {
	callback = function()
		vim.highlight.on_yank({
			higroup = "Visual",
			timeout = "200",
		})
	end,
})

-- `q` or `ESC` to quit from common buffers
vim.api.nvim_create_autocmd({"FileType"}, {
	pattern = {
		"help",
		"checkhealth",
		"",
	},
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "q", "<CMD>q<CR>", {noremap = true, silent = true})
		vim.api.nvim_buf_set_keymap(0, "n", "<ESC>", "<CMD>q<CR>", {noremap = true, silent = true})
	end,
})

-- Disable auto-comment on newline
-- Do it once on startup and again whenever we open a new buffer
vim.cmd("set formatoptions-=cro")
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

