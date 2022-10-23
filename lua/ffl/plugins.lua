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

return packer.startup(function(use)
	-- Plugin Manager
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- LSP
	use("neovim/nvim-lspconfig") -- Quickstart configuration for the Neovim LSP client
	use("williamboman/mason.nvim") -- Easily install and manage LSP servers, DAP servers, linters and formatters
	use("williamboman/mason-lspconfig.nvim") -- Bridge mason.nvim with nvim-lspconfig
	use("jose-elias-alvarez/null-ls.nvim") -- Inject LSP diagnostics, code actions and more via Lua
	use("ray-x/lsp_signature.nvim") -- LSP signature hint when you type
	use("simrat39/symbols-outline.nvim") -- Tree like view for symbols in Neovim
	use("b0o/SchemaStore.nvim") -- Provide access to the SchemaStore catalog
	use("christianchiarulli/rust-tools.nvim") -- Tools for better development in Rust
	use("mfussenegger/nvim-jdtls") -- Extensions for the built-in LSP for jdt.ls
	-- use"j-hui/fidget.nvim" -- Standalone UI for LSP progress
	use({"FWFWLL/fidget.nvim", branch="fix-error-315"}) -- Standalone UI for LSP progress
	-- use("folke/trouble.nvim") -- Pretty diagnostics list

	-- Completion
	use("hrsh7th/nvim-cmp") -- Completion engine
	use("hrsh7th/cmp-buffer") -- Nvim-cmp source for buffer words
	use("hrsh7th/cmp-path") -- Nvim-cmp for filesystem paths
	use("hrsh7th/cmp-nvim-lsp") -- Nvim-cmp source for native LSP
	use("hrsh7th/cmp-emoji") -- Nvim-cmp source for emoji
	use("hrsh7th/cmp-nvim-lua") -- Nvim-cmp source for the Neovim lua api
	use("saadparwaiz1/cmp_luasnip") -- Nvim-cmp source for luasnip completion
	use("david-kunz/cmp-npm") -- nvim-cmp source for NPM

	-- Markdown
	use({"iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end}) -- Markdown preview for Neovim

	-- Syntax
	use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}) -- Neovim treesitter configuration and abstraction layer
	use("nvim-treesitter/playground") -- Treesitter playground integrated into Neovim
	use("kylechui/nvim-surround") -- Add/change/delete surround delimiter pairs
	use("tikhomirov/vim-glsl") -- Syntax highlighting for GLSL
	use("beyondmarc/hlsl.vim") -- Syntax highlighting for HLSL

	-- Terminal integration
	use("akinsho/toggleterm.nvim") -- Easily manage multiple terminal windows

	-- Snippet
	use("L3MON4D3/LuaSnip") -- Snippets in Lua
	use("rafamadriz/friendly-snippets") -- Snippets collection

	-- Fuzzy Finder
	use("nvim-telescope/telescope.nvim") -- Highly extendable fuzzy finder
	use("nvim-telescope/telescope-file-browser.nvim") -- File browser extension for telescope.nvim

	-- Color
	use("xiyaowong/nvim-transparent") -- Transparent background
	use("norcalli/nvim-colorizer.lua") -- Hex-color highlighter

	-- Colorschemes
	use("tomasr/molokai") -- Molokai theme

	-- Utility
	use("famiu/bufdelete.nvim") -- Delete Neovim buffers without losing your window layout.
	use("tpope/vim-repeat") -- Enable repeating plugins maps with `.`
	use("lewis6991/impatient.nvim") -- Speeds up loading Neovim
	use("stevearc/dressing.nvim") -- Improve built-in `vim.ui` interfaces
	use("rcarriga/nvim-notify") -- Fancy notifications
	use("saifulapm/chartoggle.nvim") -- Toggle `,` and `;` at the end of line
	-- use("nkakouros-original/numbers.nvim") -- Automatically toggle between relative and absolute line numbers

	-- Icons
	use("kyazdani42/nvim-web-devicons") -- Devicons for Neovim

	-- Debugging
	use("mfussenegger/nvim-dap") -- Debug Adapter Protocol client implementation for Neovim
	use("rcarriga/nvim-dap-ui") -- A UI for nvim-dap
	use("theHamsta/nvim-dap-virtual-text") -- Virtual text support for nvim-dap

	-- Neovim Lua Development
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("christianchiarulli/lua-dev.nvim") -- Neovim Lua API development environment

	-- Statusline
	use("nvim-lualine/lualine.nvim") -- Easy to configure Neovim statusline

	-- Tabline
	use("akinsho/bufferline.nvim") -- Snazzy buffer line for Neovim

	-- Winbar and Statusline component
	-- use("SmiteshP/nvim-navic") -- useLSP to show current code context

	-- Cursorline
	use("RRethy/vim-illuminate") -- Highlight the word under the cursor

	-- Startup
	use("goolord/alpha-nvim") -- Highly customizable greeter for Neovim

	-- Indent
	use("lukas-reineke/indent-blankline.nvim") -- Whitespace guides/lines

	-- File Explorer
	use("kyazdani42/nvim-tree.lua") -- File tree explorer

	-- Dependency Management
	use("saecki/crates.nvim") -- Nvim-cmp source for crates.io dependencies

	-- Git
	use("lewis6991/gitsigns.nvim") -- Git integration: signs, hunk actions, blame etc.

	-- Comment
	use("NumToStr/Comment.nvim") -- Smart and powerful commenting

	-- Motion
	use("ggandor/leap.nvim") -- General-purpose motion plugin for Neovim

	-- Project
	use("ahmedkhalf/project.nvim") -- All in one project manager

	-- Editing Support
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("windwp/nvim-ts-autotag") -- Autopairs for html, xml, jsx tags
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Treesitter context aware commenting
	use("nacro90/numb.nvim") -- Peek lines in a non-obtrusive way
	use("gbprod/stay-in-place.nvim") -- Prevent cursor from moving when using shift and filter actions
	use("sQVe/sort.nvim") -- Sorting plugin

	-- Session
	use("olimorris/persisted.nvim") -- Simple sessions manager

	-- Split and Window
	-- use("luukvbaal/stabilize.nvim") -- Stabilized window content on window open/close events

	-- Automatically set up configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
