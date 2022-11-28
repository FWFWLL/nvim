local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	return
end

local icons = require("ffl.icons")

-- NOTE: Ordering matters for display
local sources = {
	nvim_lsp = "[LSP]",
	nvim_lua = "[LUA]",
	luasnip = "[SNIP]",
	buffer = "[FILE]",
	path = "[PATH]",
}

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	return
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<S-Right>"] = cmp.mapping(function()
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			end
		end, {"i", "s"}),
		["<S-Left>"] = cmp.mapping(function()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end, {"i", "s"}),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete({}), {"i", "c"}),
		["<CR>"] = cmp.mapping(cmp.mapping.confirm({select = false}), {"i", "c"}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, {"i"}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, {"i"}),
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
		{name = "nvim_lua"},
		{name = "luasnip"},
		{name = "buffer"},
		{name = "path"},
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = "rounded",
		},
		completion = {
			border = "rounded",
		},
	},
	experimental = {
		ghost_text = true,
	},
})
