---@diagnostic disable: assign-type-mismatch

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

local colors = {
	bg = "#1C1C1C",
	aquamarine = "#54DA97",
	gray = "#777777",
	white = "#EEEEEE",
	red = "#F92672",
	missing_fg = "#000000",
	missing_bg = "#FF00DC",
}

local icons = require("ffl.icons")

bufferline.setup {
	options = {
		numbers = "none",
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator = {
			style = "none",
		},
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
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
				separator = true,
			}
		},
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
		fill = {fg = colors.white, bg = colors.bg},
		background = {fg = colors.gray, bg = colors.bg},
		tab = {fg = colors.gray, bg = colors.bg},
		tab_selected = {fg = colors.aquamarine, bg = colors.bg},
		tab_close = {fg = colors.white, bg = colors.bg},
		close_button = {fg = colors.white, bg = colors.bg},
		buffer_visible = {
			fg = colors.gray,
			bold = true,
			italic = true,
		},
		buffer_selected = {
			fg = colors.aquamarine,
			bold = true,
			italic = true,
		},
		hint_visible = {fg = colors.gray},
		hint_selected = {
			fg = colors.aquamarine,
			bold = true,
			italic = true,
		},
		info_visible = {fg = colors.gray},
		info_selected = {
			fg = colors.aquamarine,
			bold = true,
			italic = true,
		},
		warning_visible = {fg = colors.gray},
		warning_selected = {
			fg = colors.aquamarine,
			bold = true,
			italic = true,
		},
		error_visible = {fg = colors.gray},
		error_selected = {
			fg = colors.aquamarine,
			bold = true,
			italic = true,
		},
		modified = {fg = colors.white,},
		modified_visible = {fg = colors.white},
		modified_selected = {fg = colors.white},
		separator_selected = {fg = colors.bg, bg = colors.bg},
		separator_visible = {fg = colors.bg, bg = colors.bg},
		separator = {fg = colors.bg, bg = colors.bg},
	},
}
