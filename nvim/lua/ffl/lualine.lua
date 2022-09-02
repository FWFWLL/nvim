local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local colors = {
	black = "#1C1C1C",
	white = "#EEEEEE",
	green = "#54DA97",
	yellow = "#D7FF00",
	blue = "#00005F",
}

local icons = require("ffl.icons")

local function contains(t, value)
	for _, v in pairs(t) do
		if v == value then
			return true
		end
	end

	return false
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
}

-- Show buffer indenting
local spaces = {
	function()
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

		local space = ""

		if contains(ui_filetypes, buf_ft) then
			space = " "
		end

		local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")

		if shiftwidth == nil then
			return ""
		end

		return "  " .. shiftwidth .. space .. " "
	end,
	padding = 0,
}

-- Display active LSP
local language_server = {
	function()
		local msg = "No Active LSP"

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

		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end

		for _, client in ipairs(clients) do
			return client.name
		end

		return msg
	end,
	icon = "LSP:",
}

lualine.setup {
	options = {
		icons_enabled = true,
		globalstatus = false,
		theme = {
			normal = {
				a = {
					fg = colors.blue,
					bg = colors.yellow,
				},
				c = {
					fg = colors.green,
					bg = colors.black,
				},
			},
		},
		component_seperators = {left = "", right = ""},
		section_separators = {left = "", right = ""},
		disabled_filetypes = {
			"alpha",
			"dashboard",
			"NvimTree"
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
		lualine_c = {"branch", "filename"},
		lualine_x = {language_server, spaces, "filetype"},
		lualine_y = {},
		lualine_z = {"location", "progress"},
	},
	inactive_sections = {
		lualine_a = {},
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
