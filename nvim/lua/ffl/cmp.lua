local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	return
end

local crates_status_ok, crates = pcall(require, "crates")
if not crates_status_ok then
	return
else crates.setup {}
end

local npm_status_ok, npm = pcall(require, "cmp-npm")
if not npm_status_ok then
	return
else npm.setup {}
end

local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup {
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
	mapping = cmp.mapping.preset.insert {
		["<C-k>"] = cmp.mapping(function()
			if luasnip.expandable() then luasnip.expand()
			elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump() end
		end, {"i", "s"}),
		["<C-j>"] = cmp.mapping(function()
			if luasnip.jumpable(-1) then luasnip.jump(-1) end
		end, {"i", "s"}),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
		["<C-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		["<CR>"] = cmp.mapping.confirm {select = false},
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then cmp.select_next_item()
			else fallback()
			end
		end, {"i", "s"}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then cmp.select_prev_item()
			else fallback()
			end
		end, {"i", "s"}),
	},
	formatting = {
		fields = {"abbr", "kind", "menu"},
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_lua = "[LUA]",
				luasnip = "[SNIPPET]",
				buffer = "[FILE]",
				path = "[PATH]",
				crates = "[CRATES]",
				npm = "[NPM]"
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{name = "nvim_lsp"},
		{name = "nvim_lua"},
		{name = "luasnip"},
		{name = "crates"},
		{name = "npm", keyword_length = 4},
		{name = "path"},
		{name = "buffer", keyword_length = 3},
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		ghost_text = true,
		native_menu = false,
	}
}
