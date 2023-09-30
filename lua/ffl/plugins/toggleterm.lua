local M = {"akinsho/toggleterm.nvim"}

M.version = "*"
M.keys = {
	{[[<C-\>]], "<CMD>lua _ZSH_TOGGLE()<CR>"},
	{[[<C-]>]], "<CMD>lua _PWSH_TOGGLE()<CR>"},
}

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, toggleterm = preq("toggleterm")
	if not status_ok then
		return
	end

	toggleterm.setup({
		hide_numbers = true,
		start_in_insert = true,
		autochdir = false,
		insert_mappings = true,
		terminal_mappings = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "rounded",
		},
	})

	local Terminal = require("toggleterm.terminal").Terminal

	-- ZSH
	local zsh = Terminal:new({
		direction = "float",
		on_open = function(term)
			local function buf_set_keymap(mode, lhs, rhs) vim.api.nvim_buf_set_keymap(term.bufnr, mode, lhs, rhs, {noremap = true, silent = true}) end

			buf_set_keymap("n", [[<C-\>]], "<CMD>1ToggleTerm direction=float<CR>")
			buf_set_keymap("i", [[<C-\>]], "<CMD>1ToggleTerm direction=float<CR>")
			buf_set_keymap("t", [[<C-\>]], "<CMD>1ToggleTerm direction=float<CR>")
		end,
		count = 1,
	})

	function _ZSH_TOGGLE()
		zsh:toggle()
	end

	-- PWSH
	local pwsh = Terminal:new({
		-- cmd = "pwsh.exe -nologo",
		direction = "float",
		close_on_exit = true,
		on_open = function(term)
			local function buf_set_keymap(mode, lhs, rhs) vim.api.nvim_buf_set_keymap(term.bufnr, mode, lhs, rhs, {noremap = true, silent = true}) end

			buf_set_keymap("n", "<C-]>", "<CMD>2ToggleTerm direction=float<CR>")
			buf_set_keymap("i", "<C-]>", "<CMD>2ToggleTerm direction=float<CR>")
			buf_set_keymap("t", "<C-]>", "<CMD>2ToggleTerm direction=float<CR>")
		end,
		count = 2,
	})

	function _PWSH_TOGGLE()
		pwsh:toggle()
	end
end

return M

