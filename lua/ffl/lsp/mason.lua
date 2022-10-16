---@diagnostic disable: need-check-nil, cast-local-type

local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

-- Ordering matters for language_server component in lualine.nvim
local servers = {
	"arduino_language_server",
	"clangd",
	"volar",
	"tsserver",
	"jsonls",
	"html",
	"cssls",
	"cmake",
	"tailwindcss",
	"hls",
	"jdtls",
	"kotlin_language_server",
	"omnisharp",
	"pyright",
	"rust-analyzer",
	"taplo",
	"sumneko_lua",
	"vimls",
}

local settings = {
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

mason.setup(settings)
mason_lspconfig.setup {
	ensure_installed = servers,
	automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("ffl.lsp.handlers").on_attach,
		capabilities = require("ffl.lsp.handlers").capabilities
	}

	server = vim.split(server, "@")[1]

	if server == "arduino_language_server" then
		local arduino_language_server_opts = require("ffl.lsp.settings.arduino_language_server")
		opts = vim.tbl_deep_extend("force", arduino_language_server_opts, opts)
	end

	if server == "jdtls" then
		goto continue
	end

	if server == "jsonls" then
		local jsonls_opts = require("ffl.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server == "pyright" then
		local pyright_opts = require("ffl.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "rust-analyzer" then
		local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
		if not rust_tools_status_ok then
			return
		end

		local rust_opts = require("ffl.lsp.settings.rust-tools")

		rust_tools.setup(rust_opts)

		goto continue
	end

	if server == "sumneko_lua" then
		local lua_dev_status_ok, lua_dev = pcall(require, "lua-dev")
		if not lua_dev_status_ok then
			return
		end

		local lua_opts = lua_dev.setup {
			lspconfig = {
				on_attach = opts.on_attach,
				capabilities = opts.capabilities,
			}
		}

		lspconfig.sumneko_lua.setup(lua_opts)

		goto continue
	end

	if server == "tsserver" then
		local tsserver_opts = require("ffl.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	lspconfig[server].setup(opts)
	::continue::
end
