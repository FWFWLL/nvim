local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

catppuccin.setup {
	flavour = "mocha",
	background = {
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
	term_colors = true,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false,
	no_bold = false,
	styles = {
		comments = {"italic"},
		conditionals = {"italic"},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = function(colors)
		return {
			CursorLine = {bg = colors.base},
			CmpItemMenu = {fg = colors.surface2},
		}
	end,
	integrations = {
		cmp = true,
		fidget = true,
		gitsigns = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		markdown = true,
		mason = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = {"italic"},
				hints = {"italic"},
				warnings = {"italic"},
				information = {"italic"},
			},
			underlines = {
				errors = {"underline"},
				hints = {"underline"},
				warnings = {"underline"},
				information = {"underline"},
			},
		},
		notify = true,
		nvimtree = true,
	},
}

-- Setup must be called before loading
vim.cmd.colorscheme "catppuccin"

-- Custom highlighting
