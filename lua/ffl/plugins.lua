-- Reload Neovim whenver plugins.lua is saved
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

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

	-- Completion
	use("hrsh7th/nvim-cmp") -- Completion engine
	use("hrsh7th/cmp-buffer") -- Nvim-cmp source for buffer words
	use("hrsh7th/cmp-path") -- Nvim-cmp source for filesystem paths
	use("hrsh7th/cmp-nvim-lsp") -- Nvim-cmp source for native LSP
	use("hrsh7th/cmp-nvim-lua") -- Nvim-cmp source for Neovim lua API

	-- Colorschemes
	use({"catppuccin/nvim", as = "catppuccin"}) -- Soothing pastel theme for Neovim

	-- Syntax
	use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}) -- Neovim Treesitter configurations and abstraction layer

	-- Snippets
	use({"L3MON4D3/LuaSnip", tag = "v1.*"}) -- Snippet engine written in Lua

	-- Statusline
	use({"nvim-lualine/lualine.nvim", require = {"nvim-tree/nvim-web-devicons", opt = true}}) -- A blazing fast and easy to configure Neovim statusline

	-- Neovim Lua Development
	use("folke/neodev.nvim") -- Neovim Lua API development environment

	-- Fuzzy Finder
	use({"nvim-telescope/telescope.nvim", tag = "0.1.0", requires = {"nvim-lua/plenary.nvim"}}) -- Highly extendable fuzzy finder

	-- File Exlorer
	use({"nvim-tree/nvim-tree.lua", requires = {"nvim-tree/nvim-web-devicons"}}) -- Simple and fast file explorer tree
end)
