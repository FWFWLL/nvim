local M = {"catppuccin/nvim"}

M.name = "catppuccin"

function M.config()
	local f = require("ffl.functions")

	local status_ok, catppuccin = f.preq("catppuccin")
	if not status_ok then
		return
	end

	catppuccin.setup({
		flavour = "mocha",
		transparent_background = true,
		term_colors = true,
		dim_inactive = {
			enabled = false,
		},
		integrations = {
			cmp = true,
			-- fidget = true,
			gitsigns = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
			-- markdown = true,
			-- mason = true,
			-- native_lsp = {
				-- enabled = true,
			-- },
			notify = true,
			nvimtree = true,
			treesitter = true,
			telescope = true,
		},
	})

	vim.cmd.colorscheme("catppuccin")
end

return M
