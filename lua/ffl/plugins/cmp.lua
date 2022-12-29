local M = {"hrsh7th/nvim-cmp"}

M.event = "InsertEnter"
M.dependencies = {
	"L3MON4D3/LuaSnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	{"saadparwaiz1/cmp_luasnip", name = "cmp-luasnip"},
}

function M.config()
	local preq = require("ffl.functions").preq
	local icons = require("ffl.icons")

	local cmp_status_ok, cmp = preq("cmp")
	if not cmp_status_ok then
		return
	end

	-- NOTE: Ordering matters
	local sources = {
		nvim_lsp = "[LSP]",
		luasnip = "[SNIP]",
		buffer = "[FILE]",
		path = "[PATH]",
	}

	local luasnip_status_ok, luasnip = preq("luasnip")
	if not luasnip_status_ok then
		return
	end

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
			completion = {
				border = "rounded",
			},
			documentation = {
				border = "rounded",
			},
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({select = false}),
		}),
		formatting = {
			fields = {"kind", "abbr", "menu"},
			format = function(entry, vim_item)
				vim_item.kind = icons.kind[vim_item.kind]

				vim_item.menu = sources[entry.source.name]

				return vim_item
			end,
		},
		sources = {
			{name = "nvim_lsp"},
			{name = "luasnip"},
			{name = "buffer"},
			{name = "path"},
		},
		experimental = {
			ghost_text = true,
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
	})
end

return M
