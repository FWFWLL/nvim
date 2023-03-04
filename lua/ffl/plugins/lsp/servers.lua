local M = {}

local servers = {
	"rust_analyzer",
	"clangd",
	"lua_ls",
	"jdtls",
	"tsserver",
	"jsonls",
	"cssls",
}

M.setup = function()
	local preq = require("ffl.functions").preq

	local mason_lspconfig_status_ok, mason_lspconfig = preq("mason-lspconfig")
	if not mason_lspconfig_status_ok then
		return
	end

	mason_lspconfig.setup({
		ensure_installed = servers,
		automatic_installation = true,
	})

	local lspconfig_status_ok, lspconfig = preq("lspconfig")
	if not lspconfig_status_ok then
		return
	end

	local on_attach = require("ffl.plugins.lsp.handlers").on_attach
	local capabilities = require("ffl.plugins.lsp.handlers").capabilities

	mason_lspconfig.setup_handlers({
		function(server_name)
			lspconfig[server_name].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
		["rust_analyzer"] = function()
			local rust_tools_status_ok, rust_tools = preq("rust-tools")
			if not rust_tools_status_ok then
				return
			end

			local rust_tools_cfg = require("ffl.plugins.lsp.settings.rust-tools")

			rust_tools_cfg.server = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			rust_tools.setup(rust_tools_cfg)
		end,
		["lua_ls"] = function()
			local neodev_status_ok, neodev = preq("neodev")
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
				setup_jsonls = true,
				lspconfig = true,
			})

			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = require("ffl.plugins.lsp.settings.lua_ls"),
			})
		end,
		["jsonls"] = function()
			local schemastore_status_ok, schemastore = preq("schemastore")
			if not schemastore_status_ok then
				return
			end

			local jsonls_settings = require("ffl.plugins.lsp.settings.jsonls")

			jsonls_settings.json.schemas = schemastore.json.schemas()

			lspconfig.jsonls.setup({
				settings = require("ffl.plugins.lsp.settings.jsonls"),
			})
		end,
	})
end

return M
