local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

local colors = require("ffl.colors")
local icons = require("ffl.icons")

bufferline.setup {
	options = {
		numbers = "none",
		close_command = function(bufnr)
			local bufdelete_status_ok, bufdelete = pcall(require, "bufdelete")
			if not bufdelete_status_ok then
				return
			end

			bufdelete.bufdelete(bufnr)
		end,
		right_mouse_command = "vertical sbuffer %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator = {style = "none"},
		buffer_close_icon = icons.ui.close,
		modified_icon = icons.ui.Circle,
		close_icon = "",
		left_trunc_marker = icons.ui.CircleLeft,
		right_trunc_marker = icons.ui.CircleRight,
		max_name_length = 18,
		max_prefix_length = 18,
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = true,
		diagnostics_indicator = function(count, level, _, _)
			local icon = ""
			if level == "error" then icon = icons.diagnostics.Error
			elseif level == "warning" then icon = icons.diagnostics.Warning
			else icon = icons.diagnostics.Hint
			end
			return " " .. icon .. " " .. count
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				highlight = "BufferLineBufferSelected",
				separator = true,
			},
			{
				filetype = "dapui_scopes",
				text = "DapUI",
				text_align = "center",
				highlight = "BufferLineBufferSelected",
				separator = true,
			},
			{
				filetype = "toggleterm",
				text = "Terminal",
				text_align = "center",
				highlight = "BufferLineBufferSelected",
				separator = true,
			},
		},
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icons = false,
		show_tab_indicators = false,
		persist_buffer_sort = true,
		separator_style = "thin",
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		sort_by = "insert_at_end",
	},
	highlights = {
		fill = {fg = colors.fg, bg = colors.bg},
		background = {fg = colors.gray, bg = colors.bg},
		tab = {fg = colors.gray, bg = colors.bg},
		tab_selected = {fg = colors.aquamarine, bg = colors.bg},
		tab_close = {fg = colors.fg, bg = colors.bg},
		close_button = {fg = colors.gray, bg = colors.bg},
		close_button_visible= {fg = colors.gray, bg = colors.bg},
		close_button_selected = {fg = colors.fg, bg = colors.bg},
		buffer_visible = {
			fg = colors.gray,
			bg = colors.bg,
			bold = true,
			italic = true,
		},
		buffer_selected = {
			fg = colors.aquamarine,
			bg = colors.bg,
			bold = true,
			italic = true,
		},
		diagnostic = {bg = colors.bg},
		diagnostic_visible = {bg = colors.bg},
		diagnostic_selected = {
			bg = colors.bg,
			bold = true,
			italic = true,
		},
		hint = {fg = colors.gray, bg = colors.bg},
		hint_visible = {fg = colors.gray, bg = colors.bg},
		hint_selected = {
			fg = colors.aquamarine,
			bg = colors.bg,
			bold = true,
			italic = true,
		},
		hint_diagnostic = {bg = colors.bg},
		hint_diagnostic_visible = {bg = colors.bg},
		hint_diagnostic_selected = {
			bg = colors.bg,
			bold = true,
			italic = true,
		},
		info = {fg = colors.gray, bg = colors.bg},
		info_visible = {fg = colors.gray, bg = colors.bg},
		info_selected = {
			fg = colors.aquamarine,
			bg = colors.bg,
			bold = true,
			italic = true,
		},
		info_diagnostic = {bg = colors.bg},
		info_diagnostic_visible = {bg = colors.bg},
		info_diagnostic_selected = {
			bg = colors.bg,
			bold = true,
			italic = true,
		},
		warning = {fg = colors.gray, bg = colors.bg},
		warning_visible = {fg = colors.gray, bg = colors.bg},
		warning_selected = {
			fg = colors.aquamarine,
			bg = colors.bg,
			bold = true,
			italic = true,
		},
		warning_diagnostic = {bg = colors.bg},
		warning_diagnostic_visible = {bg = colors.bg},
		warning_diagnostic_selected = {
			bg = colors.bg,
			bold = true,
			italic = true,
		},
		error = {fg = colors.gray, bg = colors.bg},
		error_visible = {fg = colors.gray, bg = colors.bg},
		error_selected = {
			fg = colors.aquamarine,
			bg = colors.bg,
			bold = true,
			italic = true,
		},
		error_diagnostic = {bg = colors.bg},
		error_diagnostic_visible = {bg = colors.bg},
		error_diagnostic_selected = {
			bg = colors.bg,
			bold = true,
			italic = true,
		},
		modified = {fg = colors.fg, bg = colors.bg},
		modified_visible = {fg = colors.fg, bg = colors.bg},
		modified_selected = {fg = colors.fg, bg = colors.bg},
		separator = {fg = colors.bg, bg = colors.bg},
		separator_visible = {fg = colors.bg, bg = colors.bg},
		separator_selected = {fg = colors.bg, bg = colors.bg},
		indicator_selected = {fg = colors.bg, bg = colors.bg},
		indicator_visible = {fg = colors.bg, bg = colors.bg},
		offset_separator = {fg = colors.bg, bg = colors.bg},
	},
}
