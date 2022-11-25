local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local icons = require("ffl.icons")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup {
	auto_reload_on_write = true,
	create_in_closed_folder = true,
	disable_netrw = false,
	hijack_cursor = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = true,
	ignore_buffer_on_setup = false,
	open_on_setup = true,
	open_on_setup_file = false,
	sort_by = "name",
	root_dirs = {},
	prefer_startup_root = true,
	sync_root_with_cwd = true,
	reload_on_bufenter = true,
	respect_buf_cwd = false,
	on_attach = "disable",
	remove_keymaps = false,
	select_prompts = false,
	view = {
		adaptive_size = true,
		centralize_selection = false,
		width = 0, -- Always as small as possible
		hide_root_folder = true,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = {},
		},
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
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "name",
		root_folder_modifier = ":~",
		indent_width = 2,
		indent_markers = {
			enable = false,
			inline_arrows = true,
			icons = {
				-- TODO: Aggregate these icons
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
			symlink_arrow = " " .. icons.misc.SymlinkArrow .. " ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = icons.documents.FileLines,
				symlink = icons.documents.SymlinkFile,
				folder = {
					arrow_open = icons.ui.ArrowOpen,
					arrow_closed = icons.ui.ArrowClosed,
					default = icons.documents.Folder,
					open = icons.documents.FolderOpen,
					empty = icons.documents.EmptyFolder,
					empty_open = icons.documents.EmptyFolderOpen,
					symlink = icons.documents.SymlinkFolder,
					symlink_open = icons.documents.SymlinkFolderOpen,
				},
				git = {
					unstaged = icons.ui.Dot,
					staged = icons.ui.Dot,
					unmerged = icons.git.Unmerged,
					renamed = icons.git.Renamed,
					untracked = icons.ui.Dot,
					deleted = icons.git.Deleted,
					ignored = icons.git.Ignored,
				},
			},
		},
		special_files = {
			"Cargo.toml",
			"Makefile",
			"README.md",
			"readme.md",
		},
		symlink_destination = true,
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
	ignore_ft_on_setup = {
		"alpha",
	},
	system_open = {
		cmd = "",
		args = {},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		debounce_delay = 50,
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = icons.diagnostics.Hint,
			info = icons.diagnostics.Information,
			warning = icons.diagnostics.Warning,
			error = icons.diagnostics.Error,
		},
	},
	filters = {
		dotfiles = false,
		custom = {"^.git$"},
		exclude = {},
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = {},
	},
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		timeout = 400,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		expand_all = {
			max_folder_discovery = 300,
			exclude = {},
		},
	},
	notify = {
		threshold = vim.log.levels.INFO,
	},
}
