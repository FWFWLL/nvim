local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
	local b = dashboard.button(sc, txt, keybind, keybind_opts)
	b.opts.hl_shortcut = "Macro"
	return b
end

local icons = require("ffl.icons")

dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	[[                                                 ]],
}

dashboard.section.buttons.val = {
	button("f", icons.documents.Files .. " " .. icons.ui.ChevronRight .. " Find file", "<CMD>Telescope find_files<CR>"),
	button("e", icons.ui.NewFile .. " " .. icons.ui.ChevronRight .. " New file", "<CMD>ene <BAR> startinsert<CR>"),
	button("p", icons.git.Repo .. " " .. icons.ui.ChevronRight .. " Find project", "<CMD>lua require('telescope').extensions.projects.projects()<CR>"),
	button("r", icons.ui.History .. " " .. icons.ui.ChevronRight .. " Recent files", "<CMD>Telescope oldfiles<CR>"),
	button("t", icons.ui.List .. " " .. icons.ui.ChevronRight .. " Find text", "<CMD>Telescope live_grep<CR>"),
	button("c", icons.ui.Gear .. " " .. icons.ui.ChevronRight .. " Config", "<CMD>e ~/.config/nvim/init.lua<CR>"),
	button("u", icons.ui.CloudDownload .. " " .. icons.ui.ChevronRight .. " Update", "<CMD>PackerSync<CR>"),
	button("q", icons.ui.SignOut .. " " .. icons.ui.ChevronRight .. " Quit", "<CMD>qa<CR>"),
}

local function footer()
	return "ffl@vivaldi.net"
end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "DashboardHeader"
dashboard.section.footer.opts.hl = "DashboardFooter"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
