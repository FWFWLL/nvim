call plug#begin()

" Appearance
Plug 'vim-airline/vim-airline' " Status bar
Plug 'xiyaowong/nvim-transparent' " Transparent background
Plug 'ryanoasis/vim-devicons' " File type icons
Plug 'lukas-reineke/indent-blankline.nvim' " Whitespace guides/lines
Plug 'ap/vim-css-color' " CSS color preview
Plug 'akinsho/bufferline.nvim' " Buffer line

" Colorschemes
Plug 'tomasr/molokai' " Molokai colorscheme

" Formatting
Plug 'windwp/nvim-autopairs' " Autopairs, integrates with cmp and treesitter
Plug 'numToStr/Comment.nvim' " Easily comment stuff

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " Treesitter based syntax highlighting
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" File tree/explorer
Plug 'kyazdani42/nvim-web-devicons' " Devicons for nvim-tree
Plug 'kyazdani42/nvim-tree.lua' " File tree explorer

" LSP
Plug 'neovim/nvim-lspconfig' " LSP configuration
Plug 'williamboman/nvim-lsp-installer' " LSP installation

" Autocompletion
Plug 'hrsh7th/nvim-cmp' " Autocompletion engine
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lua' " NeoVim Lua API source for nvim-cmp
Plug 'hrsh7th/cmp-buffer' " Buffer source for nvim-cmp
Plug 'hrsh7th/cmp-path' " Path source for nvim-cmp
Plug 'hrsh7th/cmp-cmdline' " Cmdline source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' " Snippet engine
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'rafamadriz/friendly-snippets' " Snippets collection
Plug 'saecki/crates.nvim' " Crates.io source for nvim-cmp
Plug 'David-Kunz/cmp-npm' " Npm source for nvim-cmp

" Telescope
Plug 'nvim-lua/plenary.nvim' " Telescope dependency
Plug 'BurntSushi/ripgrep' " Live-grep/Rip-grep support for Telescope
Plug 'nvim-telescope/telescope.nvim' " Fuzzy finder

" Rust
Plug 'simrat39/rust-tools.nvim' " Extra rust tools

" Git
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

lua << EOF
	require("init")
EOF

" Colorscheme
colorscheme molokai

" Colorscheme overrides
hi LineNr ctermfg=15
hi CursorLineNr ctermfg=1
hi Pmenu ctermfg=15 ctermbg=233
hi VertSplit ctermfg=15 ctermbg=233

" nvim-cmp
hi CmpItemAbbr ctermfg=7
hi CmpItemAbbrMatch ctermfg=1
hi CmpItemAbbrMatchFuzzy ctermfg=11
hi CmpItemMenu ctermfg=7
hi CmpItemKindDefault ctermfg=7
hi CmpItemKindVariable ctermfg=14
hi CmpItemKindInterface ctermfg=14
hi CmpItemKindText ctermfg=14
hi CmpItemKindField ctermfg=14
hi CmpItemKindClass ctermfg=11
hi CmpItemKindConstructor ctermfg=11
hi CmpItemKindModule ctermfg=11
hi CmpItemKindStruct ctermfg=11
hi CmpItemKindEnum ctermfg=11
hi CmpItemKindEnumMember ctermfg=11
hi CmpItemKindFunction ctermfg=9
hi CmpItemKindMethod ctermfg=9
hi CmpItemKindSnippet ctermfg=13
hi CmpItemKindKeyword ctermfg=15
hi CmpItemKindProperty ctermfg=15
hi CmpItemKindUnit ctermfg=15
hi CmpItemKindConstant ctermfg=15
hi CmpItemKindReference ctermfg=15
hi CmpItemKindOperator ctermfg=15

" nvim-tree
hi NvimTreeOpenedFile ctermfg=1

" Telescope
hi TelescopeMatching ctermfg=11
hi TelescopePromptPrefix ctermfg=9
hi TelescopeBorder ctermfg=15
hi TelescopeSelection ctermfg=9

" Buffer line
hi BufferLineFill ctermbg=234
hi BufferLineBackground ctermfg=85 ctermbg=234
hi BufferLineDevIconDefault ctermbg=234
hi BufferLineCloseButton ctermfg=7 ctermbg=234
hi BufferLineCloseButtonSelected ctermfg=15
hi BufferLineCloseButtonVisible ctermfg=15
hi BufferLineModified ctermfg=7 ctermbg=234
hi BufferLineModifiedSelected ctermfg=15
hi BufferLineModifiedVisible ctermfg=15
hi BufferLineBufferSelected ctermfg=1
hi BufferLineBufferVisible ctermfg=1
hi BufferLineIndicatorSelected ctermfg=1
hi BufferLineSeparator ctermfg=234 ctermbg=234
hi BufferLineSeparatorSelected ctermfg=234 ctermbg=234
hi BufferLineTabClose ctermfg=15 ctermbg=234
hi BufferLineTabCloseSelected ctermfg=15 ctermbg=234
hi BufferLineError ctermfg=85 ctermbg=234
hi BufferLineErrorSelected ctermfg=1
hi BufferLineErrorDiagnostic ctermfg=1
hi BufferLineErrorDiagnosticSelected ctermfg=1
hi BufferLineHint ctermfg=85 ctermbg=234
hi BufferLineHintSelected ctermfg=1
hi BufferLineHintDiagnostic ctermfg=250
hi BufferLineHintDiagnosticSelected ctermfg=250
hi BufferLineInfo ctermfg=85 ctermbg=234
hi BufferLineInfoSelected ctermfg=1
hi BufferLineInfoDiagnostic ctermfg=4
hi BufferLineInfoDiagnosticSelected ctermfg=4
hi BufferLineWarning ctermfg=85 ctermbg=234
hi BufferLineWarningSelected ctermfg=1
hi BufferLineWarningDiagnostic ctermfg=3
hi BufferLineWarningDiagnosticSelected ctermfg=3

" Gitsigns
hi GitSignsAdd ctermfg=2
hi GitSignsAddInline ctermfg=64
hi GitSignsAddLn ctermfg=64
hi GitSignsChange ctermfg=6
hi GitSignsDelete ctermfg=160
hi GitSignsDeleteInline ctermfg=88
hi GitSignsDeleteLn ctermfg=88

hi Title ctermfg=208
hi MoreMsg ctermfg=208
hi Label ctermfg=13

hi DiffAdd ctermfg=2
hi DiffDelete ctermfg=160

" indent-blankline
let g:indent_blankline_char = '⁞'

" vim-airline
let g:airline_powerline_fonts = 1
