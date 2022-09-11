local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	return
end

local buffer_fts = {
	"markdown",
	"toml",
	"yaml",
	"json",
}

local function contains(t, value)
	for _, v in pairs(t) do
		if v == value then
			return true
		end
	end
	return false
end

local compare = require("cmp.config.compare")

local icons = require("ffl.icons")

require("luasnip.loaders.from_vscode").lazy_load()

vim.g.cmp_active = true

cmp.setup {
	enabled = function()
		local buftype = vim.api.nvim_buf_get_option(0, "buftype")

		if buftype == "prompt" then
			return false
		end

		return vim.g.cmp_active
	end,
	preselect = cmp.PreselectMode.None,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert {
		["<S-Right>"] = cmp.mapping(function()
			if luasnip.jumpable(1) then luasnip.jump(1)
			elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
			end
		end, {"i", "s"}),
		["<S-Left>"] = cmp.mapping(function()
			if luasnip.jumpable(-1) then luasnip.jump(-1)
			end
		end, {"i", "s"}),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
		["<m-o>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),

		["<C-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		["<C-c>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		["<m-j>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		["<m-k>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		["<m-c>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},

		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm {select = false},
		-- ["<Right>"] = cmp.mapping.confirm {select = true},
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
		fields = {"kind", "abbr", "menu"},
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = icons.kind[vim_item.kind]

			if entry.source.name == "emoji" then
				vim_item.kind = icons.misc.Smiley
				vim_item.kind_hl_group = "CmpItemKindEmoji"
			end

			if entry.source.name == "crates" then
				vim_item.kind = icons.misc.Package
				vim_item.kind_hl_group = "CmpItemKindCrates"
			end

			if entry.source.name == "npm" then
				vim_item.kind = icons.misc.Package
				vim_item.kind_hl_group = "CmpItemKindNPM"
			end

			-- NOTE: Order matters
			vim_item.menu = ({
				nvim_lsp = "",
				nvim_lua = "",
				luasnip = "",
				buffer = "",
				path = "",
				emoji = "",
				npm = "",
			})[entry.source.name]

			return vim_item
		end,
	},
	sources = {
		{name = "crates", group_index = 1},
		{
			name = "nvim_lsp",
			group_index = 2,
			filter = function(entry, ctx)
				local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
				if kind == "Snippet" and ctx.prev_context.filetype == "java" then
					return true
				end

				if kind == "Text" then
					return true
				end
			end,
		},
		{name = "nvim_lua", group_index = 2},
		{name = "luasnip", group_index = 2},
		{
			name = "buffer",
			group_index = 2,
			filter = function(_, ctx)
				if not contains(buffer_fts, ctx.prev_context.filetype) then
					return true
				end
			end,
		},
		{name = "path", group_index = 2},
		{name = "emoji", group_index = 2},
		{name = "npm", group_index = 2, keyword_length = 4},
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			compare.offset,
			compare.exact,
			-- compare.scopes,
			compare.score,
			compare.recently_used,
			compare.locality,
			-- compare.kind,
			compare.sort_text,
			compare.length,
			compare.order,
		},
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = "rounded",
			winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None"
		},
		completion = {
			border = "rounded",
			winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None"
		},
	},
	experimental = {
		ghost_text = true,
	},
}
