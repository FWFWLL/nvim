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

---@diagnostic disable-next-line: need-check-nil
DEFAULT_CONFIG = server.document_config.default_config

local config = {
	on_attach = require("ffl.lsp.handlers").on_attach,
	capabilites = require("ffl.lsp.handlers").capabilites,
	cmd = DEFAULT_CONFIG.cmd,
	root_dir = DEFAULT_CONFIG.root_dir(),
}

jdtls.start_or_attach(config)
