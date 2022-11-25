local M = {}

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

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

local function attach_navic(client, bufnr)
	local status_ok, navic = pcall(require, "nvim-navic")
	if not status_ok then
		return
	end

	vim.g.navic_silence = true

	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

local function lsp_keymaps(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local opts = {noremap = true, silent = true}

	-- Mappings
	buf_set_keymap("n", "gd", "<CMD>Telescope lsp_definitions<CR>", opts)
	buf_set_keymap("n", "gD", "<CMD>Telescope lsp_declarations<CR>", opts)
	buf_set_keymap("n", "gi", "<CMD>Telescope lsp_implementations<CR>", opts)
	buf_set_keymap("n", "gr", "<CMD>Telescope lsp_references<CR>", opts)
	buf_set_keymap("n", "K", "<CMD>lua vim.lsp.buf.hover({border = 'rounded'})<CR>", opts)
	buf_set_keymap("n", "<M-a>", "<CMD>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "<M-r>", "<CMD>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<M-f>", "<CMD>Format<CR>", opts)
	buf_set_keymap("n", "gl", "<CMD>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)

	-- Clangd
	if client.name == "clangd" then
		buf_set_keymap("n", "go", "<CMD>ClangdSwitchSourceHeader<CR>", opts)
	end

	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({async = true})' ]]
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(client, bufnr)
	attach_navic(client, bufnr)

	client.server_capabilities.documentFormattingProvider = false

	-- jdt.ls
	if client.name == "jdtls" then
		---@diagnostic disable-next-line: undefined-global
		if JAVA_DAP_ACTIVE then
			require("jdtls").setup_dap({hotcodereplace = "auto"})
			require("jdtls.dap").setup_dap_main_class_configs()
		end
	end
end

return M
