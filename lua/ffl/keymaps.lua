local opts = {noremap = true, silent = true}

-- local term_opts = {silent = true}

-- Shorten function name
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", "<CMD>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<CMD>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<CMD>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<CMD>vertical resize +2<CR>", opts)

-- Buffer navigation
keymap("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep original yank after paste
keymap("v", "p", '"_dP', opts)

-- Select --
-- Stop pasting when super-tabbing
keymap("s", "p", "p", opts)

-- Allow tabbing when super-tabbing
keymap("s", "<Tab>", "<DEL>i", opts)

-- Custom --
-- I hate trailing whitespaces
keymap("n", "<F6>", "<CMD>let _s=@/ <BAR> %s/\\s\\+$//e <BAR> let @/=_s<CR>", opts)

-- I hate space indenting
keymap("n", "<F7>", "<CMD>set ts=2 sts=2 noet <BAR> retab! <BAR> set ts=4 sts=4 noet <BAR> retab!<CR>", opts)
keymap("n", "<F8>", "<CMD>set ts=4 sts=4 et <BAR> retab! <BAR> set ts=4 sts=4 noet <BAR> retab!<CR>", opts)

-- Nvim-tree
keymap("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>f", "<CMD>Telescope find_files<CR>", opts)
keymap("n", "<leader>r", "<CMD>Telescope oldfiles<CR>", opts)
keymap("n", "<leader>t", "<CMD>Telescope live_grep<CR>", opts)
keymap("n", "<leader>p", "<CMD>Telescope projects<CR>", opts)

-- Bufferline
keymap("n", "<M-1>", "<CMD>BufferLineGoToBuffer 1<CR>")
keymap("n", "<M-2>", "<CMD>BufferLineGoToBuffer 2<CR>")
keymap("n", "<M-3>", "<CMD>BufferLineGoToBuffer 3<CR>")
keymap("n", "<M-4>", "<CMD>BufferLineGoToBuffer 4<CR>")
keymap("n", "<M-5>", "<CMD>BufferLineGoToBuffer 5<CR>")
keymap("n", "<M-6>", "<CMD>BufferLineGoToBuffer 6<CR>")
keymap("n", "<M-7>", "<CMD>BufferLineGoToBuffer 7<CR>")
keymap("n", "<M-8>", "<CMD>BufferLineGoToBuffer 8<CR>")
keymap("n", "<M-9>", "<CMD>BufferLineGoToBuffer 9<CR>")
