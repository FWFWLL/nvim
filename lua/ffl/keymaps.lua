local keymap = require("ffl.functions").keymap

keymap("n", "<Space>", "")

-- keymap("n", "<C-h>", "<C-w>h")
-- keymap("n", "<C-j>", "<C-w>j")
-- keymap("n", "<C-k>", "<C-w>k")
-- keymap("n", "<C-l>", "<C-w>l")

keymap("n", "<C-S-Left>", "<CMD>bNext<CR>")
keymap("n", "<C-S-Right>", "<CMD>bnext<CR>")

-- Close buffer
keymap("n", "<Leader>bd", "<CMD>bdelete<CR>")

-- NOTE: Can be replaced with a plugin later
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

keymap("v", "p", [["_dP]])

keymap("t", "<ESC><ESC>", [[<C-\><C-n>]])

-- Super-tab fixes
keymap("s", "p", "p")
keymap("s", "<Tab>", "<DEL>i")

