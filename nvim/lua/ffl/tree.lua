local devicons_status_ok, devicons = pcall(require, "nvim-web-devicons")
if not devicons_status_ok then
	return
end

devicons.setup {
	default = true,
}

local tree_status_ok, tree = pcall(require, "nvim-tree")
if not tree_status_ok then
	return
end

local tree_config_status_ok, tree_config = pcall(require, "nvim-tree.config")
if not tree_config_status_ok then
	return
end

local tree_cb = tree_config.nvim_tree_callback

tree.setup {
	create_in_closed_folder = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},
	view = {
		adaptive_size = true,
		width = 30,
		side = "left",
		signcolumn = "yes",
		mappings = {
			list = {
				{key = {"l", "<CR>", "o"}, cb = tree_cb("edit")},
				{key = "h", cb = tree_cb("clode_node")},
				{key = "v", cb = tree_cb("vsplit")},
			}
		}
	},
	renderer = {
		add_trailing = true,
		highlight_git = true,
		highlight_opened_files = "name",
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
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
					untracked = "",
					deleted = "",
					ignored = "◌",
				}
			}
		}
	}
}
