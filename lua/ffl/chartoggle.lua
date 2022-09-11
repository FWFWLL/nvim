local status_ok, chartoggle = pcall(require, "chartoggle")
if not status_ok then
	return
end

chartoggle.setup {
	leader = "<leader>",
	keys = {",", ";"},
}
