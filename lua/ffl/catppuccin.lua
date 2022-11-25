local catppuccin_status_ok, catppuccin = pcall(require, "catppuccin")
if not catppuccin_status_ok then
	return
end

catppuccin.setup {
	flavour = "mocha",
	background = {
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
	term_colors = false,
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
	custom_highlights = {},
	integrations = {
		bufferline = true,
		fidget = true,
		gitsigns = true,
		indent_blankline = true,
		leap = true,
		lualine = true,
		mason = true,
		cmp = true,
		dap = {
			enabled = true,
			enable_ui = true,
		},
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
		treesitter = true,
		telescope = true,
	},
}

-- Setup must be called before loading
vim.cmd.colorscheme "catppuccin"
