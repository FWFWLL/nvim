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
	use("hrsh7th/cmp-nvim-lsp") -- Nvim-cmp source for native LSP

	-- Colorschemes
	use({"catppuccin/nvim", as = "catppuccin"}) -- Soothing pastel theme for Neovim

	-- Syntax
	use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}) -- Neovim Treesitter configurations and abstraction layer

	-- Neovim Lua Development
	use("folke/neodev.nvim") -- Neovim Lua API development environment

	-- Fuzzy Finder
	use({"nvim-telescope/telescope.nvim", tag = "0.1.0", requires = {"nvim-lua/plenary.nvim"}}) -- Highly extendable fuzzy finder

	-- File Exlorer
	use({"nvim-tree/nvim-tree.lua", requires = {"nvim-tree/nvim-web-devicons"}}) -- Simple and fast file explorer tree
end)
