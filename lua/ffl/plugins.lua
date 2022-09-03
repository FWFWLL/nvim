local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/paacker.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
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
		prompt_border = "rounded", -- Border style of prompt popups.
	},
}

-- Install plugins here
return packer.startup(function(use)
	-- Plugin Manager
	use "wbthomason/packer.nvim" -- Have packer manage itself

	-- Foundation
	use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
	-- use "nvim-lua/popup.nvim" -- Popup API for Neovim
	use "christianchiarulli/lua-dev.nvim"

	-- LSP
	use "neovim/nvim-lspconfig" -- Enable native LSP
	-- use "williamboman/nvim-lsp-installer" -- Simple to use language server installer
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	-- use "jose-elias-alvarez/null-ls.nvim"
	use "ray-x/lsp_signature.nvim"
	use "b0o/SchemaStore.nvim"
	use "RRethy/vim-illuminate"
	-- use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

	-- Completion
	use "hrsh7th/nvim-cmp" -- Completion engine
	use "hrsh7th/cmp-buffer" -- Nvim-cmp source for buffer words
	use "hrsh7th/cmp-path" -- Nvim-cmp for paths of files an folders
	-- use "hrsh7th/cmp-cmdline" -- Nvim-cmp source for command line suggestions
	use "hrsh7th/cmp-nvim-lsp" -- Nvim-cmp source for native LSP
	use "hrsh7th/cmp-emoji" -- Nvim-cmp source for emoji
	use "hrsh7th/cmp-nvim-lua" -- Nvim-cmp source for Neovim's Lua API
	use "saadparwaiz1/cmp_luasnip" -- Nvim-cmp source for luasnip
	-- use "David-Kunz/cmp-npm" -- Nvim-cmp source for npm packages

	-- Snippet
	use "L3MON4D3/LuaSnip" -- Snippet engine
	use "rafamadriz/friendly-snippets" -- Snippets collection

	-- Syntax/Treesitter
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
	-- use "p00f/nvim-ts-rainbow"
	-- use "nvim-treesitter/playground"
	-- use "kylechui/nvim-surround"

	-- Fuzzy Finder/Telescope
	use "nvim-telescope/telescope.nvim"

	-- Colorschemes
	use "tomasr/molokai" -- Molokai theme
	-- use "folke/tokyonight.nvim" -- TokyoNight theme from VS Code

	-- Utility
	use "moll/vim-bbye"
	use "lewis6991/impatient.nvim"

	-- Icons
	use "kyazdani42/nvim-web-devicons" -- Devicons for nvim-tree

	-- Debugging
	-- use "mfussenegger/nvim-dap"
	-- use "rcarriga/nvim-dap-ui"
	-- use "Pocco81/DAPInstall.nvim"

	-- Tabline
	use "akinsho/bufferline.nvim"

	-- Statusline
	use "nvim-lualine/lualine.nvim"

	-- Startup
	use "goolord/alpha-nvim"

	-- Indent
	use "lukas-reineke/indent-blankline.nvim" -- Whitespace guides/lines

	-- File Explorer
	use "kyazdani42/nvim-tree.lua" -- File tree explorer

	-- Comment
	use "NumToStr/Comment.nvim" -- Smart and powerful commenting
	use "JoosepAlviste/nvim-ts-context-commentstring" -- Treesitter context aware commenting

	-- Terminal
	use "akinsho/toggleterm.nvim"

	-- Project
	use "ahmedkhalf/project.nvim"

	-- Git
	use "lewis6991/gitsigns.nvim"

	-- Editing Support
	use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
	use "windwp/nvim-ts-autotag" -- Autopairs for html tags

	-- Rust
	use "christianchiarulli/rust-tools.nvim"
	use "saecki/crates.nvim" -- Nvim-cmp source for crates.io dependencies

	-- Unsorted
	use "xiyaowong/nvim-transparent" -- Transparent background
	use "norcalli/nvim-colorizer.lua" -- Hex-color highlighter

	-- Automatically set up configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
