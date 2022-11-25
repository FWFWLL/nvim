local status_ok, persisted = pcall(require, "persisted")
if not status_ok then
	return
end

vim.o.sessionoptions = "buffers,curdir,folds,terminal,winpos,winsize"

persisted.setup {
	save_dir = vim.fn.stdpath("data") .. "/sessions/",
	command = "VimLeavePre",
	silent = false,
	use_git_branch = false,
	autosave = true,
	should_autosave = nil,
	autoload = false,
	on_autoload_no_session = nil,
	follow_cwd = true,
	allowed_dirs = nil,
	ignored_dirs = nil,
	before_save = nil,
	after_save = nil,
	after_source = nil,
	telescope = {
		before_source = function()
			local bufdelete_status_ok, _ = pcall(require, "bufdelete")
			if bufdelete_status_ok then
				vim.api.nvim_input("<ESC><CMD>bufdo Bdelete<CR>")
			else
				vim.api.nvim_input("<ESC><CMD>%bd<CR>")
			end
		end,
		after_source = function(session)
			vim.defer_fn(function()
				local notify_status_ok, notify = pcall(require, "notify")
				if notify_status_ok then
					notify("Loaded session " .. session.name, vim.log.levels.INFO, {title = "persisted.nvim"})
				else
					print("Loaded session " .. session.name)
				end
			end, 0)
		end,
		reset_prompt_after_deletion = true,
	},
}

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

telescope.load_extension("persisted")
