local M = {"nvim-telescope/telescope.nvim"}

M.dependencies = {"nvim-lua/plenary.nvim"}
M.cmd = {"Telescope"}

local function project_files()
	local opts = {}

	if vim.loop.fs_stat(".git") then
		opts.show_untracked = true

		require("telescope.builtin").git_files(opts)
	else
		local client = vim.lsp.get_active_clients()[1]
		if client then
			opts.cwd = client.config.root_dir
		end

		require("telescope.builtin").find_files(opts)
	end
end

M.keys = {
	{"<Leader>ff", project_files},
	{"<Leader>fg", "<CMD>Telescope live_grep<CR>"}
}

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, telescope = preq("telescope")
	if not status_ok then
		return
	end

	local actions = require("telescope.actions")

	local icons = require("ffl.icons")

	telescope.setup({
		defaults = {
			layout_strategy = "horizontal",
			prompt_prefix = icons.ui.ChevronRight .. " ",
			selection_caret = icons.ui.ChevronRight .. " ",
			path_display = {"tail"},
			mappings = {
				n = {
					["<ESC>"] = actions.close,
				},
				i = {
					["<ESC>"] = actions.close,
				},
			},
		},
	})
end

return M
