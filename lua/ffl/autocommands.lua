-- Remove statusline and tabline from Alpha
vim.api.nvim_create_autocmd({"User"}, {
	pattern = {"AlphaReady"},
	callback = function()
		vim.cmd [[
			set showtabline=0 | autocmd BufUnload <buffer> set showtabline=3
		]]
	end,
})

-- `q` or `ESC` to quit from common plugins
vim.api.nvim_create_autocmd({"FileType"}, {
	pattern = {
		"Jaq",
		"qf",
		"help",
		"checkhealth",
		"man",
		"lspinfo",
		"spectre_panel",
		"lir",
		"DressingSelect",
		"tsplayground",
		"Markdown",
		"",
	},
	callback = function()
		vim.cmd [[
			nnoremap <silent> <buffer> q :close<CR>
			nnoremap <silent> <buffer> <ESC> :close<CR>
			set nobuflisted
		]]
	end,
})

-- Set wrap and spell in markdown
vim.api.nvim_create_autocmd({"FileType"}, {
	pattern = {"markdown"},
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.wrap = true
	end,
})

-- Fixes Autocomment and `number.nvim` relative numbering
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
	callback = function()
		-- vim.opt_local.relativenumber = true
		vim.cmd "set formatoptions-=cro"
	end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({"TextYankPost"}, {
	callback = function()
		vim.highlight.on_yank {
			higroup = "Visual",
			timeout = 100,
		}
	end,
})
