local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 1,
	completeopt = {"menuone", "noselect"},
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = false,
	mouse = "a",
	pumheight = 10,
	showmode = false,
	-- showtabline = 2,
	-- smartcase = true,
	autoindent = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	-- swapfile = false,
	-- termguicolors = true,
	-- undofile = true,
	updatetime = 300,
	-- writebackup = false,
	smarttab = true,
	shiftwidth = 4,
	tabstop = 4,
	softtabstop = 4,
	cursorline = true,
	number = true,
	relativenumber = true,
	signcolumn = "yes",
	wrap = false,
	scrolloff = 8,
	sidescrolloff = 8,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]
