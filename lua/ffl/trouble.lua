local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

local icons = require("ffl.icons")

trouble.setup {
	position = "bottom",
	height = 10,
	mode = "workspace_diagnostics",
	fold_open = icons.ui.ArrowOpen,
	fold_closed = icons.ui.ArrowClosed,
	auto_open = false,
	auto_close = false,
	auto_preview = true,
	auto_jump = {"lsp_definitions"},
	signs = {
		error = icons.legacy.Error,
		warning = icons.legacy.Warning,
		hint = icons.legacy.Hint,
		information = icons.legacy.Information,
		other = icons.legacy.Other,
	},
	use_diagnostic_signs = false,
}
