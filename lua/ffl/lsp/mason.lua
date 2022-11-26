local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

-- Ordering matters for display
local servers = {
	"sumneko_lua",
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

	server = vim.split(server, "@", {})[1]

	if server == "sumneko_lua" then
		local neodev_status_ok, neodev = pcall(require, "neodev")
		if not neodev_status_ok then
			return
		end

		neodev.setup {
			library = {
				enabled = true,
				runtime = true,
				types = true,
				plugins = true,
			},
			lspconfig = true,
		}

		lspconfig.sumneko_lua.setup {
			on_attach = opts.on_attach,
			capabilities = opts.capabilities,
			settings = require("ffl.lsp.settings.sumneko_lua")
		}

		goto continue
	end

	lspconfig[server].setup(opts)

	::continue::
end
