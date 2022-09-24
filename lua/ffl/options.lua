local options = {
	backup = false,                        -- Creates a backup file
	clipboard = "unnamedplus",             -- Allows neovim to access the system clipboard
	cmdheight = 1,                         -- More space in the neovim command line for displaying messages
	completeopt = {"menuone", "noselect"}, -- Mostly just for cmp
	conceallevel = 0,                      -- So that `` is visible in markdown files
	fileencoding = "utf-8",                -- The encoding written to a file
	hlsearch = false,                       -- Highlight all matches on previous search pattern
	ignorecase = true,                     -- Ignore case in search patterns
	mouse = "a",                           -- Allows the mouse to be used in neovim
	pumheight = 10,                        -- Pop up menu height
	showmode = false,                      -- We dont't need to see thins like -- INSERT -- anymore
	showtabline = 0,                       -- Always show tabs
	smartcase = true,                      -- Smart case
	smartindent = true,                    -- Make indenting smarter again
	splitbelow = true,                     -- Force all horizontal splits to go below current window
	splitright = true,                     -- Force all ertical splits to go to the right of the current window
	swapfile = false,                      -- Creates a swapfile
	termguicolors = true,                  -- Set term gui colros (most terminals support this)
	timeoutlen = 1000,                     -- Time to wait for a mapped sequence to complete (in milliseconds)
	-- undofile = true,                    -- Enable persistent undo
	updatetime = 100,                      -- Faster completion (4000ms default)
	writebackup = false,                   -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false,                     -- Convert tabs to spaces
	shiftwidth = 4,                        -- The number of spaces inserted for each indentation
	tabstop = 4,                           -- Insert 2 spaces for a tab
	cursorline = true,                     -- Highlight the current line
	number = true,                         -- Set numbered lines
	laststatus = 3,                        --
	showcmd = true,                        --
	ruler = false,                         --
	relativenumber = true,                 -- Set relative numbered lines
	numberwidth = 4,                       -- Set number column width to 2 (default 4)
	signcolumn = "yes",                    -- Always show the sign colum, otherwise it would shift the text each time
	wrap = false,                          -- Display lines as one long line
	scrolloff = 8,                         --  
	sidescrolloff = 8,                     --
	title = true,                          --
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.g.arduino_dir = "/usr/share/arduino/"

vim.cmd [[set iskeyword+=-]]

vim.opt.fillchars = vim.opt.fillchars + 'eob: '
vim.opt.fillchars:append {
	stl = ' ',
}
