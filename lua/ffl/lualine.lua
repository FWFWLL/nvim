local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local colors = require("ffl.colors")
local icons = require("ffl.icons")

local hide_in_width_55 = function()
	return vim.o.columns > 55
end

local hide_in_width_60 = function()
	return vim.o.columns > 60
end

local hide_in_width_80 = function()
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
	cond = hide_in_width_55,
}

-- Show current Git branch
local branch = {
	"branch",
	cond = hide_in_width_60,
}

-- Display active LSP
local language_server = {
	function()
		local msg = "Inactive"

		local ui_filetypes = {
			"help",
			"checkhealth",
			"packer",
			"NvimTree",
			"toggleterm",
			"DressingSelect",
			"TelescopePrompt",
			"lspinfo",
			"mason",
			"",
		}

		if vim.tbl_contains(ui_filetypes, vim.bo.filetype) then
			return ""
		end

		local buf_clients = vim.lsp.get_active_clients({bufnr = vim.api.nvim_get_current_buf()})
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
	cond = hide_in_width_80,
}

local clock = {
	function()
		return os.date("%H") .. ":" .. os.date("%M")
	end,
}

lualine.setup {
	options = {
		icons_enabled = true,
		globalstatus = false,
		theme = {
			normal = {
				a = {
					fg = colors.navy,
					bg = colors.lime,
				},
				c = {
					fg = colors.aquamarine,
					bg = colors.bg,
				},
			},
		},
		component_seperators = {left = "", right = ""},
		section_separators = {left = "", right = ""},
		disabled_filetypes = {
			"alpha",
			"NvimTree",
		},
		always_divide_middle = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {"mode", diagnostics},
		lualine_b = {},
		lualine_c = {branch},
		lualine_x = {"filetype", language_server},
		lualine_y = {},
		lualine_z = {clock},
	},
	inactive_sections = {
		lualine_a = {diagnostics},
		lualine_b = {},
		lualine_c = {"filename"},
		lualine_x = {"filetype"},
		lualine_y = {},
		lualine_z = {clock},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {"nvim-dap-ui", "toggleterm"},
}
