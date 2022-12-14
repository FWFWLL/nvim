local function keymap(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, {noremap = true, silent = true}) end

-- Remap space as leader key
keymap("n", "<Space>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
keymap("n", "<C-Up>", "<CMD>resize -2<CR>")
keymap("n", "<C-Down>", "<CMD>resize +2<CR>")
keymap("n", "<C-Left>", "<CMD>vertical resize -2<CR>")
keymap("n", "<C-Right>", "<CMD>vertical resize +2<CR>")

-- Buffer navigation
keymap("n", "<C-S-Left>", "<CMD>bNext<CR>")
keymap("n", "<C-S-Right>", "<CMD>bnext<CR>")

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Keep original yank after paste
keymap("v", "p", [["_dP]])

-- Super-tab fixes
keymap("s", "p", "p")
keymap("s", "<Tab>", "<DEL>i")

-- Enter normal mode in terminal
keymap("t", "<ESC><ESC>", [[<C-\><C-n>]])

-- Telescope
keymap("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
keymap("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
keymap("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
keymap("n", "<leader>fp", "<CMD>Telescope projects<CR>")

-- Nvim-tree
keymap("n", "<leader>e", "<CMD>NvimTreeToggle<CR>")
