local M = {}

local servers = {
	"rust_analyzer",
	"clangd",
	"sumneko_lua",
	"jdtls",
	"tsserver",
	"jsonls",
}

function M.setup()
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
		["sumneko_lua"] = function()
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

			lspconfig.sumneko_lua.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = require("ffl.plugins.lsp.settings.sumneko_lua"),
			})
		end,
	})
end

return M
