local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 1,
	completeopt = {"menu", "menuone", "noselect"},
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = false,
	ignorecase = true,
	mouse = "a",
	mousemodel = "",
	pumheight = 10,
	showmode = false,
	showtabline = 0,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	timeoutlen = 1000,
	undofile = true,
	updatetime = 100,
	writebackup = false,
	expandtab = false,
	shiftwidth = 4,
	tabstop = 4,
	cursorline = true,
	number = true,
	laststatus = 3,
	showcmd = true,
	ruler = false,
	relativenumber = true,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = false,
	scrolloff = 8,
	sidescrolloff = 8,
	title = true,
}

for option, value in pairs(options) do
	vim.opt[option] = value
end

vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append({stl = " "})

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd("set iskeyword+=-")

