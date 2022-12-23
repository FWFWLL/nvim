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

-- Fixes autocomment
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end
})
