local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup {
	disable_netrw = false,
	hijack_netrw = true,
	open_on_setup = true,
	auto_reload_on_write = true,
	create_in_closed_folder = false,
	sort_by = "name",
	hijack_unnamed_buffer_when_opening = true,
	hijack_cursor = true,
	sync_root_with_cwd = true,
	reload_on_bufenter = true,
	respect_buf_cwd = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	diagnostics = {
		enable = true,
		debounce_delay = 50, --ms
		show_on_dirs = true,
		-- TODO: Aggregate icons
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
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
		ignore_dirs = {},
	},
	on_attach = "disable",
	remove_keymaps = false,
	select_prompts = false,
	view = {
		adaptive_size = true,
		centralize_selection = false,
		hide_root_folder = true,
		width = 0,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		float = {
			enable = false,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 30,
				height = 30,
				row = 1,
				col = 1,
			},
		},
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
			inline_arrows = false,
			-- TODO: Aggregate icons
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			-- TODO: Aggregate icon
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			-- TODO: Aggregate icons
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		special_files = {
			"Cargo.toml",
			"Makefile",
			"makefile",
			"README.md",
			"readme.md",
		},
		symlink_destination = true,
	},
	filters = {
		custom = {"^.git$"},
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
}
