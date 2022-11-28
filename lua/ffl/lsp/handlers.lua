local M = {}

local function lsp_keymaps(client, bufnr)
	local function buf_set_keymap(mode, lhs, rhs) vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, {noremap = true, silent = true}) end

	-- Mappings
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

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilites = cmp_nvim_lsp.default_capabilities()

M.setup = function()
	local icons = require("ffl.icons")

	local signs = {
		{name = "DiagnosticSignError", text = icons.diagnostics.Error},
		{name = "DiagnosticSignWarn", text = icons.diagnostics.Warning},
		{name = "DiagnosticSignHint", text = icons.diagnostics.Hint},
		{name = "DiagnosticSignInfo", text = icons.diagnostics.Information},
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, {texthl = sign.name, text = sign.text, numhl = ""})
	end

	vim.diagnostic.config {
		virtual_lines = true,
		virtual_text = true,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "if_many",
			header = "",
			prefix = "",
		},
	}

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

return M
