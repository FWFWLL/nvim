local preq = require("ffl.functions").preq

local status_ok, cmp_nvim_lsp = preq("cmp_nvim_lsp")
if not status_ok then
	return
end

return cmp_nvim_lsp.default_capabilities()

