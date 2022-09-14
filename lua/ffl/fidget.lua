local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
	return
end

fidget.setup {
	text = {
		spinner = "circle_quarters",
		done = "✓",
		commenced = "Started",
		completed = "Completed",
	},
	align = {
		bottom = true,
		right = true,
	},
	window = {
		relative = "win",
		blend = 0,
		zindex = nil,
	},
	timer = {
		spinner_rate = 100,
		fidget_decay = 2000,
		task_decay = 1000,
	}
}
