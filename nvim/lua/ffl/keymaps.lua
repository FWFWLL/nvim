local opts = {noremap = true, silent = true}

-- local term_opts = {silent = true}

local keymap = vim.api.nvim_set_keymap -- Shortened function name

-- Remap space as leader key
keymap("", "<Space>", "Nop", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- NERDTree
keymap("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>f", "<Cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = false}))<CR>", opts)
keymap("n", "<C-t>", "<Cmd>Telescope live_grep<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", "<Cmd>resize +2<CR>", opts)
keymap("n", "<C-Down>", "<Cmd>resize -2<CR>", opts)
keymap("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", opts)

-- Buffer navigation
keymap("n", "<S-l>", "<Cmd>bnext<CR>", opts)
keymap("n", "<S-h>", "<Cmd>bprevious<CR>", opts)

-- I hate mix-indent and trailing whitespaces
keymap("n", "<F6>", "<Cmd>let _s=@/<Bar>%s/\\s\\+$//e<Bar>let @/=_s<CR>", opts)
keymap("n", "<F7>", "<Cmd>set ts=2 sts=2 noet <Bar> retab! <Bar> set ts=4 sts=4 noet <Bar> retab!<CR>", opts)
keymap("n", "<F8>", "<Cmd>set ts=4 sts=4 et <Bar> retab! <Bar> set ts=4 sts=4 noet <Bar> retab!<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep original yank after paste
keymap("v", "p", '"_dP', opts)
