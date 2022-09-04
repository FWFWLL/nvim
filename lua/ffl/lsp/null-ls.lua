local status_ok, null_ls = pcall(require, "null-ls")
if status_ok then
	return
end

null_ls.setup {
	debug = false,
}
