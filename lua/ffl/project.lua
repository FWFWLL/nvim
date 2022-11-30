local status_ok, project_nvim = pcall(require, "project_nvim")
if not status_ok then
	return
end

project_nvim.setup({
	manual_mode = false,
	detection_methods = {
		"pattern",
		"lsp",
	},
	patterns = {
		".git",
		"Makefile",
		"makefile",
		"package.json",
	},
	exclude_dirs = {
		"~/.config/nvim/lua/", -- NOTE: Some plugin keeps cd-ing to this directory
	},
	show_hidden = false,
	silent_chdir = true,
	scope_chdir = "global",
	datapath = vim.fn.stdpath("data"),
})

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

telescope.load_extension("projects")
