local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

local function on_attach(bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local opts = {noremap = true, silent = true}

	-- Navigation
	buf_set_keymap("n", "]c", "&diff ? ']c' : '<Cmd>Gitsigns next_hunk<CR>'", {expr = true})
	buf_set_keymap("n", "[c", "&diff ? '[c' : '<Cmd>Gitsigns prev_hunk<CR>'", {expr = true})

	-- Actions
	buf_set_keymap("n", "<leader>hs", "<Cmd>Gitsigns stage_hunk<CR>", opts)
	buf_set_keymap("v", "<leader>hs", "<Cmd>Gitsigns stage_hunk<CR>", opts)
	buf_set_keymap("n", "<leader>hr", "<Cmd>Gitsigns reset_hunk<CR>", opts)
	buf_set_keymap("v", "<leader>hr", "<Cmd>Gitsigns reset_hunk<CR>", opts)
	buf_set_keymap("n", "<leader>hS", "<Cmd>Gitsigns stage_buffer<CR>", opts)
	buf_set_keymap("n", "<leader>hu", "<Cmd>Gitsigns undo_stage_hunk<CR>", opts)
	buf_set_keymap("n", "<leader>hp", "<Cmd>Gitsigns preview_hunk<CR>", opts)
	buf_set_keymap("n", "<leader>hb", "<Cmd>lua require('gitsigns').blame_line({full=true})<CR>", opts)
	buf_set_keymap("n", "<leader>td", "<Cmd>Gitsigns toggle_deleted<CR>", opts)
end

gitsigns.setup {
	signs = {
		add = {
			hl = "GitSignsAdd",
			text = "▎",
			numhl = "GitSignsAddNr",
			linehl = "GitSignsAddLn",
		},
		change = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn"
		},
		delete = {
			hl = "GitSignsDelete",
			text = "契",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn"
		},
		topdelete = {
			hl = "GitSignsDelete",
			text = "契",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn"
		},
		changedelete = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn"
		},
	},
	signcolumn = true, -- `:Gitsigns toggle_signs`
	numhl = false, -- `:Gitsigns toggle_numhl`
	linehl = false, -- `:Gitsigns toggle_linehl`
	word_diff = false, -- `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- `eol` | `overlay` | `right_align`
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "rounded",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
	on_attach = on_attach,
}
