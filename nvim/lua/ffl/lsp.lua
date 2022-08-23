-- Define custom diagnostic signs
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, {
		texthl = sign.name,
		text = sign.text,
		numhl = "",
	})
end

local config = {
	virtual_text = true, -- Enable virtual text
	signs = {
		active = signs, -- Show signs
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	}
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
	width = 60,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
	width = 60,
})

local config_status_ok, lspconfig = pcall(require, "lspconfig")
if not config_status_ok then
	return
end

local installer_status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installer_status_ok then
	return
end

lsp_installer.setup {
	automatic_installation = true,
	ui = {
		border = "rounded",
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		}
	}
}

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local opts = {noremap = true, silent = true}

	-- Mappings
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover({border = 'rounded'})<CR>", opts)
	buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gl", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

	-- Format on save
	-- if client.resolved_capabilities.document_formatting then
	--	vim.api.nvim_exec(
	--		[[
	--		augroup lsp_document_formatting
	--			autocmd! * <buffer>
	--			autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync({tab_size = 2, insertSpaces = false, trimTrailingWhiteSpace = true, trimFinalNewLines = true})
	--		augroup END
	--		]], false
	--	)
	-- end

	-- Document highlighting on hover
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
			]], false
		)
	end
end

local cnl_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cnl_status_ok then
	return
end

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
	"ccls",
	"cssls",
	"html",
	"jsonls",
	"sumneko_lua",
	"tailwindcss",
	"taplo",
	"tsserver",
	"vimls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if lsp == "jsonls" then
		lspconfig[lsp].setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = require("ffl.settings.jsonls"),
			setup = {
				commands = {
					Format = {
						function()
							vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
						end,
					}
				}
			}
		}
	end

	if lsp == "sumneko_lua" then
		lspconfig[lsp].setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = require("ffl.settings.sumneko_lua"),
		}
	end
end

-- Automatically sets up rust_analyzer for us
local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
if not rust_tools_status_ok then
	return
end

rust_tools.setup {
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = require("ffl.settings.rust_analyzer"),
	},
	tools = {
		autoSetHints = true,
		hover_with_hints = true,
		inlay_hints = {
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "=> ",
		},
		hover_actions = {
			border = "rounded",
		},
	}
}
