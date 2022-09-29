local opts = {noremap = true, silent = true}

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
keymap("n", "<C-S-Left>", "<CMD>BufferLineCyclePrev<CR>", opts)
keymap("n", "<C-S-Right>", "<CMD>BufferLineCycleNext<CR>", opts)

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
keymap("n", "<leader>ff", "<CMD>Telescope find_files<CR>", opts)
keymap("n", "<leader>fb", "<CMD>Telescope file_browser<CR>", opts)
keymap("n", "<leader>r", "<CMD>Telescope oldfiles<CR>", opts)
keymap("n", "<leader>t", "<CMD>Telescope live_grep<CR>", opts)
keymap("n", "<leader>p", "<CMD>Telescope projects<CR>", opts)
keymap("n", "<leader>s", "<CMD>Telescope persisted<CR>", opts)

-- Nvim-dap
keymap("n", "<leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>")
keymap("n", "<leader>dc", "<CMD>lua require('dap').continue()<CR>")
keymap("n", "<leader>dI", "<CMD>lua require('dap').step_into()<CR>")
keymap("n", "<leader>do", "<CMD>lua require('dap').step_over()<CR>")
keymap("n", "<leader>dO", "<CMD>lua require('dap').step_out()<CR>")
keymap("n", "<leader>dr", "<CMD>lua require('dap').repl.open()<CR>")
keymap("n", "<leader>dl", "<CMD>lua require('dap').run_last()<CR>")
keymap("n", "<leader>du", "<CMD>lua require('dapui').toggle()<CR>")
keymap("n", "<leader>dx", "<CMD>lua require('dap').terminate()<CR>")

-- Bufferline
keymap("n", "<M-1>", "<CMD>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<M-2>", "<CMD>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<M-3>", "<CMD>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<M-4>", "<CMD>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<M-5>", "<CMD>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>b<Left>", "<CMD>BufferLineMovePrev<CR>", opts)
keymap("n", "<leader>b<Right>", "<CMD>BufferLineMoveNext<CR>", opts)

-- Symbols-Outline
-- keymap("n", "<leader>o", "<CMD>SymbolsOutline<CR>", opts)

-- Leap
keymap("n", "s", "<CMD>lua require('leap').leap {target_windows = {vim.fn.win_getid()}}<CR>", opts)
