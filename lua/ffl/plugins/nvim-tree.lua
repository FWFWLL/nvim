local M = {"nvim-tree/nvim-tree.lua"}

M.lazy = false
M.dependencies = {
	"nvim-tree/nvim-web-devicons",
}
M.keys = {
	{"<Leader>e", "<CMD>NvimTreeToggle<CR>"},
}

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, nvim_tree = preq("nvim-tree")
	if not status_ok then
		return
	end

	local icons = require("ffl.icons")

	nvim_tree.setup({
		disable_netrw = true,
		auto_reload_on_write = true,
		hijack_unnamed_buffer_when_opening = true,
		hijack_cursor = true,
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = true,
			ignore_list = {"toggleterm"},
		},
		diagnostics = {
			enable = true,
			debounce_delay = 50, -- ms
			show_on_dirs = true,
			icons = {
				hint = icons.diagnostics.Hint,
				info = icons.diagnostics.Information,
				warning = icons.diagnostics.Warning,
				error = icons.diagnostics.Error,
			},
			severity = {
				min = vim.diagnostic.severity.HINT,
				max = vim.diagnostic.severity.ERROR,
			},
		},
		modified = {
			enable = false,
			show_on_dirs = true,
			show_on_open_dirs = true,
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
			centralize_selection = false,
			cursorline = true,
			hide_root_folder = true,
			width = {
				min = 0,
				max = nil,
			},
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
				modified_placement = "after",
				padding = " ",
				symlink_arrow = " " .. icons.ui.SymlinkArrow .. " ",
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
					modified = true,
				},
				glyphs = {
					default = icons.ui.DefaultFile,
					symlink = icons.ui.SymlinkFile,
					bookmark = icons.ui.Bookmark,
					modified = icons.ui.Modified,
					folder = {
						arrow_closed = icons.ui.ArrowClosed,
						arrow_open = icons.ui.ArrowOpen,
						default = icons.ui.Folder,
						open = icons.ui.FolderOpen,
						empty = icons.ui.EmptyFolder,
						empty_open = icons.ui.EmptyFolderOpen,
						symlink = icons.ui.SymlinkFolder,
						symlink_open = icons.ui.SymlinkFolderOpen,
					},
					git = {
						unstaged = icons.git.Unstaged,
						staged = icons.git.Staged,
						unmerged = icons.git.Unmerged,
						renamed = icons.git.Renamed,
						untracked = icons.git.Untracked,
						deleted = icons.git.Deleted,
						ignored = icons.git.Ignored,
					},
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
				quit_on_open = false,
			},
		},
	})

	local function open_nvim_tree(data)
		-- Buffer is a [No Name]
		local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

		-- Buffer is a directory
		local directory = vim.fn.isdirectory(data.file) == 1

		if not no_name and not directory then
			return
		end

		-- Change to the directory
		if directory then
			vim.cmd.cd(data.file)
		end

		-- Open the tree
		require("nvim-tree.api").tree.open()
	end

	vim.api.nvim_create_autocmd({"VimEnter"}, {
		callback = open_nvim_tree,
	})
end

return M
