local M = {"lewis6991/gitsigns.nvim"}

M.event = "BufReadPost"

function M.config()
	local preq = require("ffl.functions").preq

	local status_ok, gitsigns = preq("gitsigns")
	if not status_ok then
		return
	end

	local icons = require("ffl.icons")

	local function on_attach(bufnr)
		local gs = package.loaded.gitsigns

		local function keymap(mode, lhs, rhs, opts)
			opts = vim.tbl_extend("force", {noremap = true, silent = true, buffer = bufnr}, opts or {})

			vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- Navigation
		keymap("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end

			vim.schedule(function()
				gs.next_hunk()
			end)

			return "<Ignore>"
			end, {expr = true})

		keymap("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end

			vim.schedule(function()
				gs.prev_hunk()
			end)

			return "<Ignore>"
			end, {expr = true})

		-- Actions
		keymap({"n", "v"}, "<leader>hs", "<CMD>Gitsigns stage_hunk<CR>")
		keymap({"n", "v"}, "<leader>hr", "<CMD>Gitsigns reset_hunk<CR>")

		keymap("n", "<leader>hS", gs.stage_buffer)
		keymap("n", "<leader>hR", gs.reset_buffer)

		keymap("n", "<leader>hu", gs.undo_stage_hunk)
		keymap("n", "<leader>hp", gs.preview_hunk)
		keymap("n", "<leader>hd", gs.toggle_deleted)

		-- Text Object
		keymap({"o", "x"}, "ih", "<CMD>Gitsigns select_hunk<CR>")
	end

	gitsigns.setup({
		signs = {
			add = {text = icons.gitsigns.Add},
			change = {text = icons.gitsigns.Change},
			delete = {text = icons.gitsigns.Delete},
			topdelete = {text = icons.gitsigns.TopDelete},
			changedelete = {text = icons.gitsigns.ChangeDelete},
			untracked = {text = icons.gitsigns.Untracked},
		},
		signcolumn = true,
		preview_config = {
			border = "rounded",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
		on_attach = on_attach,
	})
end

return M
