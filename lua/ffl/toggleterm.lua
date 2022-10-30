local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

local opts = {noremap = true, silent = true}

toggleterm.setup {
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<C-S-\>]],
	on_open = function()
		vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
	end,
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		windblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
}

local Terminal = require("toggleterm.terminal").Terminal

-- Powershell
local pwsh = Terminal:new {
	cmd = "pwsh.exe -nologo",
	direction = "float",
	on_open = function(term)
		local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(term.bufnr, ...) end

		vim.cmd "startinsert!"

		buf_set_keymap("n", "<C-]>", "<CMD>99ToggleTerm direction=float<CR>", opts)
		buf_set_keymap("t", "<C-]>", "<CMD>99ToggleTerm direction=float<CR>", opts)
		buf_set_keymap("i", "<C-]>", "<CMD>99ToggleTerm direction=float<CR>", opts)
	end,
	count = 99,
}

function _PWSH_TOGGLE()
	pwsh:toggle()
end

vim.keymap.set("n", "<C-]>", "<CMD>lua _PWSH_TOGGLE()<CR>", opts)
vim.keymap.set("i", "<C-]>", "<CMD>lua _PWSH_TOGGLE()<CR>", opts)

-- Regular Float Terminal
local float_term = Terminal:new {
	direction = "float",
	on_open = function(term)
		local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(term.bufnr, ...) end

		vim.cmd "startinsert!"

		buf_set_keymap("n", [[<C-\>]], "<CMD>1ToggleTerm direction=float<CR>", opts)
		buf_set_keymap("t", [[<C-\>]], "<CMD>1ToggleTerm direction=float<CR>", opts)
		buf_set_keymap("i", [[<C-\>]], "<CMD>1ToggleTerm direction=float<CR>", opts)
	end,
	count = 1,
}

function _FLOAT_TERM()
	float_term:toggle()
end

vim.keymap.set("n", [[<C-\>]], "<CMD>lua _FLOAT_TERM()<CR>", opts)
vim.keymap.set("i", [[<C-\>]], "<CMD>lua _FLOAT_TERM()<CR>", opts)
