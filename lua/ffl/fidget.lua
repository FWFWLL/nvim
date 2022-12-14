local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
	return
end

fidget.setup({
	text = {
		spinner = "dots",
		done = "✓",
		commenced = "Started",
		completed = "Completed",
	},
	align = {
		bottom = true,
		right = true,
	},
	timer = {
		spinner_rate = 125,
		fidget_decay = 2000,
		task_decay = 1000,
	},
	window = {
		relative = "win",
		blend = 0,
		zindex = nil,
		border = "rounded",
	},
})
