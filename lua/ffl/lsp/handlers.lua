local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status_ok then
	return
end

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

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

	local config = {
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

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_keymaps(bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local opts = {noremap = true, silent = true}

	-- Mappings
	buf_set_keymap("n", "gd", "<CMD>Telescope lsp_definitions<CR>", opts)
	buf_set_keymap("n", "gD", "<cmd>Telescope lsp_declarations<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover({border = 'rounded'})<CR>", opts)
	buf_set_keymap("n", "<M-a>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	buf_set_keymap("n", "<M-r>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	buf_set_keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
end

M.on_attach = function(_, bufnr)
	lsp_keymaps(bufnr)
end

return M
