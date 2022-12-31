local M = {"ahmedkhalf/project.nvim"}

M.event = "BufReadPost"
M.dependencies = {
	"nvim-telescope/telescope.nvim",
}
M.keys = {
	{"<Leader>fp", "<CMD>Telescope projects<CR>"},
}

M.config = function()
	local preq = require("ffl.functions").preq

	local project_status_ok, project = preq("project_nvim")
	if not project_status_ok then
		return
	end

	project.setup({
		manual_mode = false,
		detection_methods = {
			"lsp",
			"pattern",
		},
		patterns = {
			".git",
			"Makefile",
			"makefile",
			"Cargo.toml",
			"package.json",
		},
		exclude_dirs = {
			"~/.config/nvim/lua/",
			"~/.cargo/"
		},
		show_hidden = false,
		silent_chdir = true,
		scope_chdir = "global",
		datapath = vim.fn.stdpath("data")
	})

	local telescope_status_ok, telescope = preq("telescope")
	if not telescope_status_ok then
		return
	end

	telescope.load_extension("projects")
end

return M
