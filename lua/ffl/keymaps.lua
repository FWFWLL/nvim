local f = require("ffl.functions")

-- Remap space as leader key
f.keymap("n", "<Space>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
f.keymap("n", "<C-h>", "<C-w>h")
f.keymap("n", "<C-j>", "<C-w>j")
f.keymap("n", "<C-k>", "<C-w>k")
f.keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
f.keymap("n", "<C-Up>", "<CMD>resize -2<CR>")
f.keymap("n", "<C-Down>", "<CMD>resize +2<CR>")
f.keymap("n", "<C-Left>", "<CMD>vertical resize -2<CR>")
f.keymap("n", "<C-Right>", "<CMD>vertical resize +2<CR>")

-- Buffer navigation
f.keymap("n", "<C-S-Left>", "<CMD>BufferLineCyclePrev<CR>")
f.keymap("n", "<C-S-Right>", "<CMD>BufferLineCycleNext<CR>")

-- Disable Command Line menu
f.keymap("n", "q:", "")

-- Visual --
-- Stay in indent mode
f.keymap("v", "<", "<gv")
f.keymap("v", ">", ">gv")

-- Keep original yank after paste
f.keymap("v", "p", '"_dP')

-- Select --
-- Stop pasting when super-tabbing
f.keymap("s", "p", "p")

-- Allow tabbing when super-tabbing
f.keymap("s", "<Tab>", "<DEL>i")

-- Terminal --
f.keymap("t", "<ESC><ESC>", [[<C-\><C-n>]])

-- Custom --
-- I hate trailing whitespaces
f.keymap("n", "<F6>", "<CMD>let _s=@/ <BAR> %s/\\s\\+$//e <BAR> let @/=_s<CR>")

-- I hate space indenting
f.keymap("n", "<F7>", "<CMD>set ts=2 sts=2 noet <BAR> retab! <BAR> set ts=4 sts=4 noet <BAR> retab!<CR>")
f.keymap("n", "<F8>", "<CMD>set ts=4 sts=4 et <BAR> retab! <BAR> set ts=4 sts=4 noet <BAR> retab!<CR>")

-- Nvim-tree
f.keymap("n", "<leader>e", "<CMD>NvimTreeToggle<CR>")

-- Telescope
f.keymap("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
f.keymap("n", "<leader>fb", "<CMD>Telescope file_browser<CR>")
f.keymap("n", "<leader>r", "<CMD>Telescope oldfiles<CR>")
f.keymap("n", "<leader>t", "<CMD>Telescope live_grep<CR>")
f.keymap("n", "<leader>p", "<CMD>Telescope projects<CR>")
f.keymap("n", "<leader>s", "<CMD>Telescope persisted<CR>")
f.keymap("n", "<leader>n", "<CMD>lua require('telescope').extensions.notify.notify(require('telescope.themes').get_dropdown({}))<CR>")
f.keymap("n", "<leader>bb", "<CMD>Telescope buffers<CR>")

-- Nvim-dap
f.keymap("n", "<leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>")
f.keymap("n", "<leader>dc", "<CMD>lua require('dap').continue()<CR>")
f.keymap("n", "<leader>dI", "<CMD>lua require('dap').step_into()<CR>")
f.keymap("n", "<leader>do", "<CMD>lua require('dap').step_over()<CR>")
f.keymap("n", "<leader>dO", "<CMD>lua require('dap').step_out()<CR>")
f.keymap("n", "<leader>dr", "<CMD>lua require('dap').repl.open()<CR>")
f.keymap("n", "<leader>dl", "<CMD>lua require('dap').run_last()<CR>")
f.keymap("n", "<leader>du", "<CMD>lua require('dapui').toggle()<CR>")
f.keymap("n", "<leader>dx", "<CMD>lua require('dap').terminate()<CR>")

-- Bufferline
f.keymap("n", "<M-1>", "<CMD>BufferLineGoToBuffer 1<CR>")
f.keymap("n", "<M-2>", "<CMD>BufferLineGoToBuffer 2<CR>")
f.keymap("n", "<M-3>", "<CMD>BufferLineGoToBuffer 3<CR>")
f.keymap("n", "<M-4>", "<CMD>BufferLineGoToBuffer 4<CR>")
f.keymap("n", "<M-5>", "<CMD>BufferLineGoToBuffer 5<CR>")
f.keymap("n", "<leader>b<Left>", "<CMD>BufferLineMovePrev<CR>")
f.keymap("n", "<leader>b<Right>", "<CMD>BufferLineMoveNext<CR>")
f.keymap("n", "<leader>bp", "<CMD>BufferLinePick<CR>")

-- Leap
f.keymap("n", "s", "<CMD>lua require('leap').leap {target_windows = {vim.fn.win_getid()}}<CR>")
