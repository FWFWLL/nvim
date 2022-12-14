local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
	return
end

dressing.setup({
	input = {
		enabled = true,
		default_prompt = "Input:",
		prompt_align = "left",
		insert_only = true,
		start_in_insert = true,
		anchor = "SW",
		border = "rounded",
		relative = "cursor",
		prefer_width = 40,
		width = nil,
		max_width = {140, 0.9},
		min_width = {20, 0.2},
		buf_options = {},
		win_options = {
			winblend = 0,
			wrap = false,
		},
	},
	select = {
		enabled = true,
		backend = {"builtin", "telescope"},
		trim_prompt = true,
		builtin = {
			anchor = "NW",
			border = "rounded",
			relative = "editor",
			win_options = {
				winblend = 0,
			},
			width = nil,
			max_width = {140, 0.8},
			min_width = {40, 0.2},
			height = nil,
			max_height = 0.9,
			min_height = {10, 0.2},
		},
		telescope = nil,
	},
})
