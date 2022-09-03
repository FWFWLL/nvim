local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	return
end

project.setup {
	active = true,
	on_config_done = nil,
	manual_mode = false,
	detection_methods = {"lsp", "pattern"},
	patterns = {
		".git",
		"Cargo.toml",
		"makefile",
		"package.json",
		"*.sln",
	},
	show_hidden = false,
	silent_chdir = true,
	ignore_lsp = {},
	datapath = vim.fn.stdpath("data"),
}

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

telescope.load_extension("projects")
