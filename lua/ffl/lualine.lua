local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local clock = {
	function()
		return os.date("%H") .. ":" .. os.date("%M")
	end
}

lualine.setup {
	options = {
		icons_enabled = true,
		theme = "catppuccin",
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
		},
	},
	sections = {
		lualine_a = {"mode"},
		lualine_b = {"branch", "diff", "diagnostics"},
		lualine_c = {"filename"},
		lualine_x = {"filetype"},
		lualine_y = {},
		lualine_z = {clock},
	},
	extensions = {
		"nvim-tree",
	},
}
