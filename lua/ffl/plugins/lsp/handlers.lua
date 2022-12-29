local M = {}

local function lsp_keymaps(client, bufnr)
	local function buf_set_keymap(mode, lhs, rhs) vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, {noremap = true, silent = true}) end

	-- General
	buf_set_keymap("n", "gd", "<CMD>Telescope lsp_definitions<CR>")
	buf_set_keymap("n", "gr", "<CMD>Telescope lsp_references<CR>")
	buf_set_keymap("n", "K", [[<CMD>lua vim.lsp.buf.hover({border = "rounded"})<CR>]])
	buf_set_keymap("n", "<M-a>", "<CMD>lua vim.lsp.buf.code_action()<CR>")
	buf_set_keymap("n", "<M-r>", "<CMD>lua vim.lsp.buf.rename()<CR>")
	buf_set_keymap("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>")
	buf_set_keymap("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>")

	-- Clangd
	if client.name == "clangd" then
		buf_set_keymap("n", "go", "<CMD>ClangdSwitchSourceHeader<CR>")
	end
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(client, bufnr)

	client.server_capabilities.documentFormattingProvider = false
end

local f = require("ffl.functions")

local status_ok, cmp_nvim_lsp = f.preq("cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
