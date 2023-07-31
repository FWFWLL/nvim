local M = {"williamboman/mason-lspconfig.nvim"}

M.event = "BufReadPost"
M.dependencies = {
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"simrat39/rust-tools.nvim",
	"folke/neodev.nvim",
	"b0o/SchemaStore.nvim",
	"mfussenegger/nvim-jdtls",
}

local servers = {
	"clangd",
	"cssls",
	"jdtls",
	"jsonls",
	"lua_ls",
	"omnisharp",
	"pyright",
	"rust_analyzer",
	"tsserver",
	"volar",
}

M.config = function()
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

	local on_attach = require("ffl.lsp.handlers.on_attach")
	local capabilities = require("ffl.lsp.handlers.capabilities")

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

			local rust_tools_cfg = require("ffl.lsp.settings.rust-tools")

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
				settings = require("ffl.lsp.settings.lua_ls"),
			})
		end,
		["jsonls"] = function()
			local schemastore_status_ok, schemastore = preq("schemastore")
			if not schemastore_status_ok then
				return
			end

			local jsonls_settings = require("ffl.lsp.settings.jsonls")

			jsonls_settings.json.schemas = schemastore.json.schemas()

			lspconfig.jsonls.setup({
				settings = require("ffl.lsp.settings.jsonls"),
			})
		end,
		["jdtls"] = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {"java"},
				callback = function()
					local nvim_jdtls_status_ok, nvim_jdtls = preq("jdtls")
					if not nvim_jdtls_status_ok then
						return
					end

					local function get_jdtls()
						local mason_registry = require("mason-registry")
						local jdtls_server = mason_registry.get_package("jdtls")
						local jdtls_path = jdtls_server:get_install_path()

						local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
						local os_config = jdtls_path .. "/config_linux"
						local lombok = jdtls_path .. "/lombok.jar"

						return launcher, os_config, lombok
					end

					local function get_workspace()
						local home = os.getenv("HOME")
						local workspace_path = home .. "/.local/share/nde/jdtls-workspace/"
						local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
						local workspace_dir = workspace_path .. project_name

						return workspace_dir
					end

					local extendedClientCapabilities = nvim_jdtls.extendedClientCapabilities
					extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

					local launcher, os_config, lombok = get_jdtls()
					local workspace_dir = get_workspace()

					local settings = require("ffl.lsp.settings.jdtls")
					settings.init_options = {
						extendedClientCapabilities = extendedClientCapabilities
					}

					local config = {
						cmd = {
							"java",
							"-Declipse.application=org.eclipse.jdt.ls.core.id1",
							"-Dosgi.bundles.defaultStartLevel=4",
							"-Declipse.product=org.eclipse.jdt.ls.core.product",
							"-Dlog.protocol=true",
							"-Dlog.level=ALL",
							"-Xms1g",
							"--add-modules=ALL-SYSTEM",
							"--add-opens",
							"java.base/java.util=ALL-UNNAMED",
							"--add-opens",
							"java.base/java.lang=ALL-UNNAMED",
							"-javaagent:" .. lombok,
							"-jar",
							launcher,
							"-configuration",
							os_config,
							"-data",
							workspace_dir,
						},
						root_dir = require("jdtls.setup").find_root({
							".git",
							"mvnw",
							"gradlew",
							"pom.xml",
							"build.gradle",
						}),
						capabilities = capabilities,
						on_attach = on_attach,
						settings = settings,
					}

					nvim_jdtls.start_or_attach(config)
				end,
			})
		end,
	})
end

return M

