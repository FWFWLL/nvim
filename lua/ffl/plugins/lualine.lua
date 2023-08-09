local M = {"nvim-lualine/lualine.nvim"}

M.event = "VeryLazy"
M.dependencies = {
	"nvim-tree/nvim-web-devicons",
}

M.config = function()
	local preq = require("ffl.functions").preq

	local status_ok, lualine = preq("lualine")
	if not status_ok then
		return
	end

	local icons = require("ffl.icons")

	-- Custom theme
	local mocha = require("catppuccin.palettes").get_palette("mocha")
	local custom_catppuccin = require("lualine.themes.catppuccin")
	custom_catppuccin.normal.c.bg = mocha.base
	custom_catppuccin.normal.b.bg = mocha.surface0

	-- Diagnostics count component
	local diagnostics = {
		"diagnostics",
		sources = {"nvim_diagnostic"},
		sections = {"error", "warn", "info", "hint"},
		symbols = {
			error = icons.diagnostics.Error .. " ",
			warn = icons.diagnostics.Warning .. " ",
			info = icons.diagnostics.Information .. " ",
			hint = icons.diagnostics.Hint .. " ",
		},
		colored = true,
		update_in_insert = true,
		always_visible = false,
	}

	-- Active LSP component
	local language_servers = {
		function()
			local msg = ""

			local buf_clients = vim.lsp.get_active_clients({bufnr = vim.api.nvim_get_current_buf()})
			if next(buf_clients) == nil then
				return msg
			end

			local buf_client_names = {}
			for _, client in pairs(buf_clients) do
				if client.name ~= "null-ls" then
					table.insert(buf_client_names, client.name)
				end
			end

			local unique_client_names = vim.fn.uniq(buf_client_names)

			return table.concat(unique_client_names, ", ")
		end,
	}

	-- Trailing whitespaces component
	local trailing_whitespaces = {
		function()
			local space = vim.fn.search([[\s\+$]], "nwc")

			return space ~= 0 and "TW: " .. space or ""
		end,
	}

	-- Mixed indentation component
	local mixed_indentation = {
		function()
			local space_pat = [[\v^ +]]
			local tab_pat = [[\v^\t+]]
			local space_indent = vim.fn.search(space_pat, "nwc")
			local tab_indent = vim.fn.search(tab_pat, "nwc")
			local mixed = (space_indent > 0 and tab_indent > 0)

			local mixed_same_line
			if not mixed then
				mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], "nwc")
				mixed = mixed_same_line > 0
			end

			if not mixed then return "" end

			if mixed_same_line ~= nil and mixed_same_line > 0 then
				return "MI: " .. mixed_same_line
			end

			local space_indent_cnt = vim.fn.searchcount({pattern = space_pat, max_count = 1e3}).total
			local tab_indent_cnt = vim.fn.searchcount({pattern = tab_pat, max_count = 1e3}).total

			if space_indent_cnt > tab_indent_cnt then
				return "MI: " .. tab_indent .. " [TAB]"
			else
				return "MI: " .. space_indent .. " [SPACE]"
			end
		end,
	}

	-- Local time component
	local clock = {
		function()
			return os.date("%H") .. ":" .. os.date("%M")
		end,
	}

	-- Custom NvimTree extension
	local nvim_tree = {
		sections = {
			lualine_a = {"vim.bo.filetype"},
			lualine_c = {
				function()
					return vim.fn.fnamemodify(vim.fn.getcwd(), ":~") .. "/"
				end,
			},
			lualine_z = {clock},
		},
		filetypes = {"NvimTree"},
	}

	-- Custom ToggleTerm extension
	local toggleterm = {
		sections = {
			lualine_a = {
				function()
					return "ToggleTerm"
				end,
			},
			lualine_c = {
				function()
					---@diagnostic disable-next-line: undefined-field
					local toggle_number = vim.b.toggle_number

					if toggle_number == 1 then
						return "zsh"
					elseif toggle_number == 2 then
						return "pwsh"
					end

					---@diagnostic disable-next-line: undefined-field
					return "ToggleTerm #" .. vim.b.toggle_number
				end,
			},
			lualine_z = {clock},
		},
		filetypes = {"toggleterm"},
	}

	-- Custom lazy.nvim extension
	local lazy = {
		sections = {
			lualine_a = {
				function()
					return "Lazy.nvim"
				end,
			},
			lualine_b = {
				function()
					local lazy_status_ok, lazy = preq("lazy")
					if not lazy_status_ok then
						return
					end

					local stats = lazy.stats()

					return stats.loaded .. " Loaded / " .. stats.count .. " Plugins"
				end,
			},
			lualine_y = {
				function()
					local lazy_status_ok, lazy = preq("lazy")
					if not lazy_status_ok then
						return
					end

					local stats = lazy.stats()

					return stats.startuptime .. "ms"
				end,
			},
			lualine_z = {clock},
		},
		filetypes = {"lazy"},
	}

	lualine.setup({
		options = {
			icons_enabled = true,
			theme = custom_catppuccin,
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
			},
		},
		sections = {
			lualine_a = {"mode"},
			lualine_b = {"branch", "diff", diagnostics},
			lualine_c = {"filename"},
			lualine_x = {"filetype"},
			lualine_y = {trailing_whitespaces, mixed_indentation, language_servers},
			lualine_z = {clock},
		},
		extensions = {
			nvim_tree,
			toggleterm,
			lazy,
		},
	})
end

return M

