---@diagnostic disable: missing-parameter

local M = {}

local colors = require("ffl.colors")
local icons = require("ffl.icons")
local f = require("ffl.functions")

M.winbar_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"gitcommit",
	"packer",
	"NvimTree",
	"alpha",
	"toggleterm",
	"DressingSelect",
	"dap-repl",
	"dap-terminal",
	"dapui_scopes",
	"dapui_breakpoints",
	"dapui_stacks",
	"dapui_watches",
	"dapui_console",
	"Markdown",
	"",
}

-- Get filename component together with icon
M.get_filename = function()
	local filename = vim.fn.expand("%:t")
	local extension = vim.fn.expand("%:e")

	if not f.empty(filename) then
		-- If `NavicText` highlight group does not exist, create it
		local hl_found, navic_text = pcall(vim.api.nvim_get_hl_by_name, "NavicText", true)
		if not hl_found then
			f.set_hl("NavicText", {fg = colors.fg, bg = colors.bg})
		end

		f.set_hl("Winbar", {fg = navic_text.foreground, bg = navic_text.background})

		-- If `nvim-web-devicons` is not installed
		local status_ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")
		if not status_ok then
			return " " .. "%#Winbar#" .. filename .. "%*"
		end

		-- Setup `nvim-web-devicons`
		local file_icon, file_icon_color = nvim_web_devicons.get_icon_color(filename, extension, {default = true})
		local hl_group = "WinbarDevIcon" .. f.capitalize(extension)

		f.set_hl(hl_group, {fg = file_icon_color, bg = navic_text.background})

		-- Set default icon if none was found
		if f.empty(file_icon) then
			file_icon = ""
			file_icon_color = ""
		end

		return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#Winbar#" .. filename .. "%*"
	end
end

local get_navic = function()
	local navic_status_ok, navic = pcall(require, "nvim-navic")
	if not navic_status_ok then
		return ""
	end

	local status_ok, navic_location = pcall(navic.get_location, {})
	if not status_ok then
		return ""
	end

	if not navic.is_available() or navic_location == "error" then
		return ""
	end

	if not f.empty(navic_location) then
		return icons.ui.ChevronRight .. " " .. navic_location
	else
		return ""
	end
end

M.get_winbar = function()
	if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
		vim.opt_local.winbar = nil
		return
	end

	local value = M.get_filename()

	-- Add navic
	local navic_added = false
	if not f.empty(value) then
		local navic_value = get_navic()
		value = value .. " " .. navic_value
		if not f.empty(navic_value) then
			navic_added = true
		end
	end

	-- Display buffer modified icon
	if not f.empty(value) and f.get_buf_option("mod") then
		-- TODO: Do this in a better way
		f.set_hl("WinbarModified", {fg = colors.fg, bg = colors.bg})

		local mod = "%#WinbarModified#" .. icons.ui.Circle .. "%*"

		if navic_added then
			value = value .. " " .. mod
		else
			value = value .. mod
		end
	end

	local num_tabs = #vim.api.nvim_list_tabpages()

	if num_tabs > 1 and not f.empty(value) then
		local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
		value = value .. "%=" .. tabpage_number .. "/" .. tostring(num_tabs)
	end

	local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, {scope = "local"})
	if not status_ok then
		return
	end
end

M.create_winbar = function()
	vim.api.nvim_create_augroup("_winbar", {})
	if vim.fn.has("nvim-0.8") == 1 then
		vim.api.nvim_create_autocmd({"CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed"}, {
			group = "_winbar",
			callback = function()
				local status_ok, _ = pcall(vim.api.nvim_buf_get_var, 0, "lsp_floating_window")
				if not status_ok then
					require("ffl.winbar").get_winbar()
				end
			end
		})
	end
end

M.create_winbar()

return M
