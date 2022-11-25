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
	cond = function()
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
			return false
		end

		return hide_in_width_55()
	end,
}

-- Show current Git branch
local branch = {
	"branch",
	cond = function()
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
			return false
		end

		return hide_in_width_60()
	end,
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

-- Show `persisted.nvim` status
local persisted = {
	function()
		if vim.g.persisting then
			return ""
		else
			return ""
		end
	end
}

-- Show local time
local clock = {
	function()
		return os.date("%H") .. ":" .. os.date("%M")
	end,
}

-- Custom nvim-dap-ui extension
local nvim_dap_ui = {
	sections = {
		lualine_a = {{"filename", file_status = false}},
		lualine_z = {clock},
	},
	filetypes = {
		"dap-repl",
		"dapui_console",
		"dapui_scopes",
		"dapui_breakpoints",
		"dapui_stacks",
		"dapui_watches",
	},
}

-- Custom ToggleTerm extension
local toggleterm = {
	sections = {
		lualine_a = {
			function()
				return "ToggleTerm #" .. vim.b.toggle_number
			end,
		},
		lualine_z = {clock},
	},
	filetypes = {"toggleterm"},
}

-- Custom Trouble extension
local trouble = {
	sections = {
		lualine_a = {"vim.bo.filetype"},
		lualine_z = {clock},
	},
	filetypes = {"Trouble"},
}

-- Custom NvimTree extension
local nvim_tree = {
	sections = {
		lualine_a = {"vim.bo.filetype"},
		lualine_c = {
			function ()
				return vim.fn.fnamemodify(vim.fn.getcwd(), ":~") .. "/"
			end,
		},
		lualine_z = {clock},
	},
	filetypes = {"NvimTree"},
}

lualine.setup {
	options = {
		icons_enabled = true,
		globalstatus = true,
		theme = "catppuccin",
		component_seperators = {left = "", right = ""},
		section_separators = {left = "", right = ""},
		disabled_filetypes = {
			"alpha",
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
		lualine_c = {branch, "filename"},
		lualine_x = {"filetype", language_server},
		lualine_y = {},
		lualine_z = {persisted, clock},
	},
	inactive_sections = {
		lualine_a = {"filename"},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {"filetype"},
		lualine_y = {},
		lualine_z = {clock},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {nvim_dap_ui, toggleterm, trouble, nvim_tree},
}
