local M = {"nvim-tree/nvim-tree.lua"}

M.dependencies = {"nvim-tree/nvim-web-devicons"}

function M.config()
	local f = require("ffl.functions")

	local status_ok, nvim_tree = f.preq("nvim-tree")
	if not status_ok then
		return
	end

	nvim_tree.setup({
		disable_netrw = true,
		open_on_setup = true,
		auto_reload_on_write = true,
		hijack_unnamed_buffer_when_opening = true,
		hijack_cursor = true,
		update_focused_file = {
			enable = true,
			update_root = true,
		},
		diagnostics = {
			enable = true,
			debounce_delay = 50, -- ms
			show_on_dirs = true,
			-- icons = {
			-- 	hint = icons.diagnostics.Hint,
			-- 	info = icons.diagnostics.Information,
			-- 	warning = icons.diagnostics.Warning,
			-- 	error = icons.diagnostics.Error,
			-- },
			severity = {
				min = vim.diagnostic.severity.HINT,
				max = vim.diagnostic.severity.ERROR,
			},
		},
		git = {
			enable = true,
			ignore = true,
			show_on_dirs = true,
			timeout = 400, -- ms
		},
		filesystem_watchers = {
			enable = true,
			debounce_delay = 50, -- ms
		},
		view = {
			adaptive_size = true,
			centralize_selection = false,
			hide_root_folder = true,
			width = 0, -- Always resize to fit content
			side = "left",
			number = false,
			relativenumber = false,
			signcolumn = "yes",
		},
		renderer = {
			add_trailing = true,
			group_empty = false,
			full_name = false,
			highlight_git = false,
			highlight_opened_files = "name",
			root_folder_label = ":~:s?$?/..?",
			indent_width = 2,
			indent_markers = {
				enable = false,
			},
			icons = {
				webdev_colors = true,
				git_placement = "before",
				padding = " ",
				-- symlink_arrow = " " .. icons.ui.SymlinkArrow .. " ",
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
			},
			special_files = {
				"Cargo.toml",
				"Makefile",
				"makefile",
				"README.md",
			},
		},
		filters = {
			custom = {"^.git$"},
		},
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
	})

	f.keymap("n", "<Leader>e", "<CMD>NvimTreeToggle<CR>")
end

return M
