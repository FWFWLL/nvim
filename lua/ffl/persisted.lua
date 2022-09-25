local status_ok, persisted = pcall(require, "persisted")
if not status_ok then
	return
end

vim.o.sessionoptions = "buffers,curdir,folds,winpos,winsize,terminal"

persisted.setup {
	save_dir = vim.fn.stdpath("data") .. "/sessions/",
	command = "VimLeavePre",
	use_git_branch = true,
	branch_separator = "_",
	autosave = true,
	autoload = false,
	on_autoload_no_session = nil,
	allowed_dirs = nil,
	ignored_dirs = nil,
	before_save = nil,
	after_save = nil,
	after_source = nil,
	telescope = {
		before_source = function()
			vim.api.nvim_input("<ESC><CMD>%bd<CR>")
		end,
		after_source = function(session)
			vim.defer_fn(function()
				local notify_status_ok, notify = pcall(require, "notify")
				if notify_status_ok then notify("Loaded session " .. session.name, vim.log.levels.INFO, {title = "Persisted.nvim"})
				else print("Loaded session " .. session.name)
				end
			end, 0)
		end,
	},
}

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

telescope.load_extension("persisted")
