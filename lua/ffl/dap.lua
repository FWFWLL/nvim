local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
	return
end

local dap_virtual_text_status_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not dap_virtual_text_status_ok then
	return
end

local icons = require("ffl.icons")

vim.fn.sign_define("DapBreakpoint", {text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = ""})
vim.fn.sign_define("DapStopped", {text = icons.ui.Search, texthl = "DiffAdd", linehl = "", numhl = ""})

dapui.setup {
	icons = {
		expanded = icons.ui.ArrowOpen,
		collapsed = icons.ui.ArrowClosed
	},
	mappings = {
		expand = {"<CR>", "<2-LeftMouse>"},
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	expand_lines = vim.fn.has("nvim-0.7"),
	layouts = {
		{
			elements = {
				{id = "scopes", size = 0.25},
				-- "breakpoints",
				-- "stacks",
				-- "watches",
				"console",
			},
			size = 50,
			position = "right",
		},
	},
	controls = {
		enabled = true,
		element = "repl",
		icons = {
			pause = icons.dap.Pause,
			play = icons.dap.Play,
			step_into = icons.dap.StepInto,
			step_over = icons.dap.StepOver,
			step_out = icons.dap.StepOut,
			step_back = icons.dap.StepBack,
			run_last = icons.dap.RunLast,
			terminate = icons.dap.Terminate,
		},
	},
	floating = {
		max_height = nil,
		max_width = nil,
		border = "rounded",
		mappings = {
			close = {"q", "<ESC>"},
		},
	},
	windows = {indent = 1},
	render = {
		max_type_length = nil,
		max_value_lines = 100,
	},
}

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open {}
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close {}
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close {}
end

dap_virtual_text.setup {}
