---@diagnostic disable: missing-parameter

local status_ok, jdtls = pcall(require, "jdtls")
if not status_ok then
	return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

local function get_server(name)
	local servers = mason_lspconfig.get_installed_servers()
	if vim.tbl_contains(servers, name) then
		return true, lspconfig[name]
	end
	return false, nil
end

local server_status_ok, server = get_server("jdtls")
if not server_status_ok then
	return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

JAVA_DAP_ACTIVE = true

local bundles = {}

if JAVA_DAP_ACTIVE then
	local home = os.getenv("HOME")
	vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.config/nvim/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.40.0.jar"), "\n"))
	vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.config/nvim/java/vscode-java-test/server/*.jar"), "\n"))
end

---@diagnostic disable-next-line: need-check-nil
local default_config = server.document_config.default_config

local config = {
	on_attach = require("ffl.lsp.handlers").on_attach,
	capabilites = require("ffl.lsp.handlers").capabilites,
	cmd = default_config.cmd,
	root_dir = default_config.root_dir(),
	settings = {
		java = {
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = false,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all",
				},
			},
			format = {
				enabled = false,
			},
		},
		signatureHelp = {
			enabled = true,
		},
		completion = {
			favoriteStaticMember = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
		},
		contentProvider = {
			preferred = "fernflower",
		},
		extendedClientCapabilities = extendedClientCapabilities,
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
	},
	flags = {
		allow_incremental_sync = true,
	},
	init_options = {
		bundles = bundles,
	},
}

jdtls.start_or_attach(config)
