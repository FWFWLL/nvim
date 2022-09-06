local status_ok, persisted = pcall(require, "persisted")
if not status_ok then
	return
end

vim.o.sessionoptions = "buffers,curdir,folds,winpos,winsize,terminal"

persisted.setup {
	save_dir = vim.fn.stdpath("data") .. "/sessions/",
	command = "VimLeavePre",
	use_git_branch = false,
	branch_separator = "_",
	autosave = true,
	autoload = false,
	on_autoload_no_session = nil,
	allowed_dirs = {
		"~/.config",
		"~/Dev",
		"/mnt/c/Users/fuwaf/Dev",
	},
	ignored_dirs = nil,
	before_save = nil,
	after_save = nil,
	after_source = nil,
	telescope = {
		before_source = nil,
		after_source = nil,
	}
}

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

telescope.load_extension("persisted")
