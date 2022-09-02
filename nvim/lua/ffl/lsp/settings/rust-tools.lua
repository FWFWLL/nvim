return {
	tools = {
		on_initialized = function()
			vim.api.nvim_create_autocmd({"bufWritePost", "BufEnter", "CursorHold", "InsertLeave"}, {
				pattern = {"*.rs"},
				callback = function()
					vim.lsp.codelens.refresh()
				end,
			})
		end,
		auto = false,
		inlay_hints = {
			only_current_line = false,
			auto = false,
			only_current_line_autocmd = "CursorHold",
			show_parameter_hints = false,
			show_variable_name = false,
			parameter_hints_prefix = " ",
			other_hints_prefix = " ",
			max_len_align = false,
			max_len_align_padding = 1,
			right_align = false,
			right_align_padding = 7,
			highlight = "Comment",
		},
		hover_actions = {
			auto_focus = false,
			border = "rounded",
			width = 60,
		},
	},
	server = {
		on_attach = require("ffl.lsp.handlers").on_attach,
		capabilities = require("ffl.lsp.handlers").capabilities,
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
				lens = {
					enable = true,
				},
				procMacro = {
					enable = true,
				},
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
}
