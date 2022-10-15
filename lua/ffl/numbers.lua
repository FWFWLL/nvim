local status_ok, numbers = pcall(require, "numbers")
if not status_ok then
	return
end

numbers.setup {
	excluded_filetypes = {
		"help",
		"startify",
		"dashboard",
		"gitcommit",
		"packer",
		"NvimTree",
		"alpha",
		"toggleterm",
		"Trouble",
		"DressingSelect",
		"TelescopePrompt",
		"dap-repl",
		"dap-terminal",
		"dapui_scopes",
		"dapui_breakpoints",
		"dapui_stacks",
		"dapui_watches",
		"dapui_console",
	}
}
