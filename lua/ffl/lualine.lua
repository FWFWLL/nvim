local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local icons = require("ffl.icons")

-- Custom theme
local mocha = require("catppuccin.palettes").get_palette("mocha")
local custom_catppuccin = require("lualine.themes.catppuccin")
custom_catppuccin.normal.c.bg = mocha.base

-- Diagnostics count component
local diagnostics = {
	"diagnostics",
	sources = {"nvim_diagnostic"},
	sections = {
		"error",
		"warn",
		"info",
		"hint",
	},
	symbols = {
		error = icons.diagnostics.Error .. " ",
		warn = icons.diagnostics.Warning .. " ",
		info = icons.diagnostics.Information .. " ",
		hint = icons.diagnostics.Hint .. " ",
	},
	colored = true,
	update_in_insert = true,
	always_visible = false,
}

-- Trailing whitespaces component
local trailing_whitespaces = {
	function()
		local space = vim.fn.search([[\s\+$]], "nwc")

		return space ~= 0 and "TW: " .. space or ""
	end
}

-- Mixed indentation component
local mixed_indentation = {
	function()
		local space_pat = [[\v^ +]]
		local tab_pat = [[\v^\t+]]
		local space_indent = vim.fn.search(space_pat, "nwc")
		local tab_indent = vim.fn.search(tab_pat, "nwc")
		local mixed = (space_indent > 0 and tab_indent > 0)

		local mixed_same_line
		if not mixed then
			mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], "nwc")
			mixed = mixed_same_line > 0
		end

		if not mixed then return "" end

		if mixed_same_line ~= nil and mixed_same_line > 0 then
			return "MI: " .. mixed_same_line
		end

		local space_indent_cnt = vim.fn.searchcount({pattern = space_pat, max_count = 1e3}).total
		local tab_indent_cnt = vim.fn.searchcount({pattern = tab_pat, max_count = 1e3}).total

		if space_indent_cnt > tab_indent_cnt then
			return "MI: " .. tab_indent .. " [TAB]"
		else
			return "MI: " .. space_indent .. " [SPACE]"
		end
	end
}

-- Local time component
local clock = {
	function()
		return os.date("%H") .. ":" .. os.date("%M")
	end
}

lualine.setup {
	options = {
		icons_enabled = true,
		theme = custom_catppuccin,
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
		},
	},
	sections = {
		lualine_a = {"mode"},
		lualine_b = {"branch", "diff", diagnostics},
		lualine_c = {"filename"},
		lualine_x = {"filetype", },
		lualine_y = {mixed_indentation, trailing_whitespaces},
		lualine_z = {clock},
	},
	extensions = {
		"nvim-tree",
	},
}
