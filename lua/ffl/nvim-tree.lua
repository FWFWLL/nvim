local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local tree_cb = require("nvim-tree.config").nvim_tree_callback

local icons = require("ffl.icons")

nvim_tree.setup {
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	create_in_closed_folder = true,
	hijack_directories = {
		enable = false,
	},
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	filters = {
		custom = {"^.git$"},
	},
	update_cwd = true,
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
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = icons.ui.ArrowOpen,
					arrow_closed = icons.ui.ArrowClosed,
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "➜",
					untracked = "+",
					deleted = "",
					ignored = "◌",
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
		update_root = true,
		update_cwd = false,
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
	},
}
