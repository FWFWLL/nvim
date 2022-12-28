vim.keymap.set("n", "<Space>", "")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-S-Left>", "<CMD>bNext<CR>")
vim.keymap.set("n", "<C-S-Right>", "<CMD>bnext<CR>")

-- NOTE: Can be replaced with a plugin later
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("v", "p", [["_dP]])

vim.keymap.set("t", "<ESC><ESC>", [[<C-\><C-n>]])
