local icons = require("ffl.icons")
local lsp_handlers = require("ffl.lsp.handlers")

return {
	tools = {
		executor = require("rust-tools/executors").termopen,
		on_initialized = nil,
		reload_workspace_from_cargo_toml = true,
		inlay_hints = {
			auto = true,
			only_current_line = false,
			show_parameter_hints = false,
			parameter_hints_prefix = icons.ui.ArrowLeft .. " ",
			other_hints_prefix = icons.ui.ArrowRight .. " ",
			max_len_align = false,
			max_len_align_padding = 1,
			right_align = false,
			right_align_padding = 7,
			highlight = "Comment",
		},
		hover_actions = {
			border = "rounded",
			auto_focus = false,
		},
	},
	server = {
		on_attach = lsp_handlers.on_attach,
		capabilities = lsp_handlers.capabilities,
		settings = {
			["rust-analyzer"] = {
				imports = {
					granularity = {
						group = "module",
					},
					prefix = "self",
				},
				cargo = {
					buildScripts = {
						enable = true,
					},
				},
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
}
