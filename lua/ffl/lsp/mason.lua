local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

-- NOTE: Ordering matters for display
local servers = {
	"clangd",
	"sumneko_lua",
	"tsserver",
	"jsonls",
}

mason.setup {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

mason_lspconfig.setup {
	ensure_installed = servers,
	automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local on_attach = require("ffl.lsp.handlers").on_attach
local capabilities = require("ffl.lsp.handlers").capabilities

mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
	["sumneko_lua"] = function()
		local neodev_status_ok, neodev = pcall(require, "neodev")
		if not neodev_status_ok then
			return
		end

		neodev.setup({
			library = {
				enabled = true,
				runtime = true,
				types = true,
				plugins = true,
			},
			lspconfig = true,
		})

		lspconfig.sumneko_lua.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = require("ffl.lsp.settings.sumneko_lua")
		})
	end,
	["jsonls"] = function()
		local schemastore_status_ok, schemastore = pcall(require, "schemastore")
		if not schemastore_status_ok then
			return
		end

		lspconfig.jsonls.setup({
			settings = {
				json = {
					schemas = schemastore.json.schemas(),
					validate = {enable = true},
				},
			},
		})
	end,
})
