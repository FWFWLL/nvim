local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Reload Neovim whenver plugins.lua is saved
vim.api.nvim_create_augroup("packer_user_config", {})
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = {"plugins.lua"},
	callback = function()
		vim.api.nvim_command("source <afile>")
		packer.sync()
	end,
	group = "packer_user_config"
})

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float {border = "rounded"}
		end,
		prompt_border = "rounded"
	},
}

return packer.startup(function(use)
	-- Plugin Manager
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- LSP
	use("neovim/nvim-lspconfig") -- Quickstart configurations for the Neovim LSP client
	use("williamboman/mason.nvim") -- Easily install and manage LSP servers, DAP servers, linters, and formatters
	use("williamboman/mason-lspconfig.nvim") -- Bridge between mason.nvim and nvim-lspconfig
	use("b0o/SchemaStore.nvim") -- Provide access to the SchemaStore catalog
	use("simrat39/rust-tools.nvim") -- Tools for better development in Rust
	use("ray-x/lsp_signature.nvim") -- LSP signature hint when you type

	-- Completion
	use("hrsh7th/nvim-cmp") -- Completion engine
	use("hrsh7th/cmp-buffer") -- Nvim-cmp source for buffer words
	use("hrsh7th/cmp-path") -- Nvim-cmp source for filesystem paths
	use("hrsh7th/cmp-nvim-lsp") -- Nvim-cmp source for native LSP
	use("hrsh7th/cmp-nvim-lua") -- Nvim-cmp source for Neovim lua API

	-- Syntax
	use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}) -- Neovim Treesitter configurations and abstraction layer

	-- Snippets
	use({"L3MON4D3/LuaSnip", tag = "v1.*"}) -- Snippet engine written in Lua

	-- Statusline
	use({"nvim-lualine/lualine.nvim", require = {"nvim-tree/nvim-web-devicons", opt = true}}) -- A blazing fast and easy to configure Neovim statusline

	-- Cursorline
	use("RRethy/vim-illuminate") -- Highlight the word under the cursor

	-- Utility
	use("saifulapm/chartoggle.nvim") -- Toggles any character at the end of line
	use("stevearc/dressing.nvim") -- Improve the built-in vim.ui interfaces

	-- Terminal Integration
	use({"akinsho/toggleterm.nvim", tag = "*"}) -- Neovim plugin to help easily manage multiple terminal windows

	-- Fuzzy Finder
	use({"nvim-telescope/telescope.nvim", tag = "0.1.0", requires = {"nvim-lua/plenary.nvim"}}) -- Highly extendable fuzzy finder

	-- File Exlorer
	use({"nvim-tree/nvim-tree.lua", requires = {"nvim-tree/nvim-web-devicons"}}) -- Simple and fast file explorer tree

	-- Project
	use("ahmedkhalf/project.nvim") -- All in one Neovim plugin that provides superior project management

	-- Colorschemes
	use({"catppuccin/nvim", as = "catppuccin"}) -- Soothing pastel theme for Neovim

	-- Neovim Lua Development
	use("folke/neodev.nvim") -- Neovim Lua API development environment

	-- Git
	use("lewis6991/gitsigns.nvim") -- Git integration: signs, hunk actions, blame, etc.

	-- Editing Support
	use("windwp/nvim-autopairs") -- A minimalist autopairs for Neovim

	-- Indent
	use("lukas-reineke/indent-blankline.nvim") -- Whitespace guides/Indent lines

	-- Comment
	use("numToStr/Comment.nvim") -- Smart and Powerful comment plugin
end)
