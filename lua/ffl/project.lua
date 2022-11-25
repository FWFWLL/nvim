local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	return
end

project.setup {
	manual_mode = false,
	detection_methods = {"lsp", "pattern"},
	patterns = {
		".git",
		"Makefile",
		"package.json",
	},
	ignore_lsp = {},
	exclude_dirs = {},
	show_hidden = false,
	silent_chdir = true,
	scope_chdir = "global",
	datapath = vim.fn.stdpath("data"),
}

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

telescope.load_extension("projects")
