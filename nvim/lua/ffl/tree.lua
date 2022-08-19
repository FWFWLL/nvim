local devicons_status_ok, devicons = pcall(require, "nvim-web-devicons")
if not devicons_status_ok then
	return
end

devicons.setup {
	default = true,
}

local tree_status_ok, tree = pcall(require, "nvim-tree")
if not tree_status_ok then
	return
end

tree.setup {
	view = {
		adaptive_size = true,
	}
}
