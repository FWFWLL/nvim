local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local tree_cb = require("nvim-tree.config").nvim_tree_callback

local icons = require("ffl.icons")

nvim_tree.setup {
	disable_netrw = true,
	open_on_setup = true,
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	create_in_closed_folder = true,
	hijack_directories = {
		enable = true,
	},
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	filters = {
		custom = {"^.git$"},
	},
	renderer = {
		add_trailing = true,
		group_empty = false,
		highlight_git = false,
		highlight_opened_files = "name",
		root_folder_modifier = ":t",
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
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = icons.diagnostics.Hint,
			info = icons.diagnostics.Information,
			warning = icons.diagnostics.Warning,
			error = icons.diagnostics.Error,
		},
	},
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		adaptive_size = true,
		hide_root_folder = true,
		width = 0, -- Always as small as possible
		side = "left",
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = {
				{key = {"l", "<CR>", "o"}, cb = tree_cb("edit")},
				{key = "h", cb = tree_cb("close_node")},
				{key = "v", cb = tree_cb("vsplit")},
			},
		},
		number = false,
		relativenumber = false,
		float = {
			enable = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 1,
				height = vim.o.lines - 6,
				row = 2, -- Bufferline & Winbar
				col = 1,
			},
		},
	},
}
