local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local icons = require("ffl.icons")

local function contains(t, value)
	for _, v in pairs(t) do
		if v == value then
			return true
		end
	end

	return false
end

local hide_in_width_lowest = function()
	return vim.o.columns > 51
end

local hide_in_width_low = function()
	return vim.o.columns > 60
end

local hide_in_width_high = function()
	return vim.o.columns > 80
end

-- Show diagnostics count
local diagnostics = {
	"diagnostics",
	sources = {"nvim_diagnostic"},
	sections = {"error", "warn", "hint"},
	symbols = {
		error = icons.diagnostics.Error .. " ",
		warn = icons.diagnostics.Warning .. " ",
		hint = icons.diagnostics.Hint .. " ",
	},
	colored = false,
	update_in_insert = true,
	always_visible = true,
	padding = 1,
	cond = hide_in_width_lowest,
}

-- Show current Git branch
local branch = {
	"branch",
	cond = hide_in_width_low,
}

-- Display active LSP
local language_server = {
	function()
		local msg = "Inactive"

		local buf_ft = vim.bo.filetype
		local ui_filetypes = {
			"help",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
			"lir",
			"Outline",
			"spectre_panel",
			"toggleterm",
			"DressingSelect",
			"TelescopePrompt",
			"lspinfo",
			"lsp-installer",
			"mason",
			"",
		}

		if contains(ui_filetypes, buf_ft) then
			return ""
		end

		---@diagnostic disable-next-line: missing-parameter
		local buf_clients = vim.lsp.buf_get_clients()
		if next(buf_clients) == nil then
			return msg
		end

		local buf_client_names = {}
		for _, client in pairs(buf_clients) do
			if client.name ~= "null-ls" then
				table.insert(buf_client_names, client.name)
			end
		end

		---@diagnostic disable-next-line: missing-parameter
		local unique_client_names = vim.fn.uniq(buf_client_names)
		return table.concat(unique_client_names, ", ")
	end,
	icon = icons.ui.Gears,
	cond = hide_in_width_high,
}

lualine.setup {
	options = {
		icons_enabled = true,
		globalstatus = false,
		theme = {
			normal = {
				a = {
					fg = "#00005F",
					bg = "#D7FF00",
				},
				c = {
					fg = "#54DA97",
					bg = "#1C1C1C",
				},
			},
		},
		component_seperators = {left = "", right = ""},
		section_separators = {left = "", right = ""},
		disabled_filetypes = {
			"alpha",
			"dashboard",
			"NvimTree",
			"Outline",
		},
		always_divide_middle = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {"mode", diagnostics},
		lualine_b = {},
		lualine_c = {branch, "filename"},
		lualine_x = {"filetype", language_server},
		lualine_y = {},
		lualine_z = {"location"},
	},
	inactive_sections = {
		lualine_a = {diagnostics},
		lualine_b = {},
		lualine_c = {"filename"},
		lualine_x = {"filetype"},
		lualine_y = {},
		lualine_z = {"location"},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
}
