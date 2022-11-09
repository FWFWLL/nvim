# Neovim Configuration
My personal Neovim configuration.
Heavily inspired by [this config](https://github.com/ChristianChiarulli/nvim).

## Issues
`lualine.nvim` and `alpha.nvim`, for some unknown reason, causes memory usage to gradually increase while in the `alpha` start-up screen

`bufferline.nvim` buffer order isn't saved/loaded by `persisted.nvim`

`arduino_language_server` after a while, just stops running

Error on exit whenever `fidget.nvim` is on screen

`nvim-numbertoggle` causes a slight flicker when opening splits

## TODO
- [x] Set up higlighting for `nvim-navic`
- [x] Aggregate all icons to `ffl.icons`
- [x] Aggregate common functions into `ffl.functions`
- [x] Aggregate all colors to `ffl.colors`
- [ ] Split config into sub-modules (Look at LunarVim)
	- [x] util
	- [ ] ui
