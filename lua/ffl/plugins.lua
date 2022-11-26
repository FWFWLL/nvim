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

	-- Colorschemes
	use({"catppuccin/nvim", as = "catppuccin"}) -- Soothing pastel theme for Neovim

	-- Syntax
	use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}) -- Neovim Treesitter configurations and abstraction layer

	-- File Exlorer
	use({"nvim-tree/nvim-tree.lua", requires = {"nvim-tree/nvim-web-devicons"}}) -- Simple and fast file explorer tree
end)
