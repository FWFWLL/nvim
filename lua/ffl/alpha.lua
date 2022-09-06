local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, cmd)
	local b = dashboard.button(sc, txt, cmd)
	b.opts.hl_shortcut = "CursorLineNr"
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
	button("f", icons.documents.Files .. " " .. icons.ui.ChevronRight .. " Find File", "<CMD>Telescope find_files<CR>"),
	button("e", icons.ui.NewFile .. " " .. icons.ui.ChevronRight .. " New File", "<CMD>ene <BAR> startinsert<CR>"),
	button("p", icons.git.Repo .. " " .. icons.ui.ChevronRight .. " Find Project", "<CMD>lua require('telescope').extensions.projects.projects()<CR>"),
	button("r", icons.ui.History .. " " .. icons.ui.ChevronRight .. " Recent Files", "<CMD>Telescope oldfiles<CR>"),
	button("t", icons.ui.List .. " " .. icons.ui.ChevronRight .. " Find Text", "<CMD>Telescope live_grep<CR>"),
	button("s", icons.ui.SignIn .. " " .. icons.ui.ChevronRight .. " Find Session", "<CMD>Telescope persisted<CR>"),
	button("c", icons.ui.Gear .. " " .. icons.ui.ChevronRight .. " Config", "<CMD>e ~/.config/nvim/init.lua<CR>"),
	button("u", icons.ui.CloudDownload .. " " .. icons.ui.ChevronRight .. " Update", "<CMD>PackerSync<CR>"),
	button("q", icons.ui.SignOut .. " " .. icons.ui.ChevronRight .. " Quit", "<CMD>qa<CR>"),
}

local function footer()
	---@diagnostic disable-next-line: undefined-global
	local total_plugins = #vim.tbl_keys(packer_plugins)

	local v = vim.version()
	local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

	local datetime = os.date(" %d-%m-%Y   %H:%M:%S")

	return datetime .. "   " .. total_plugins .. " plugins  " .. version
end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "DashboardHeader"
dashboard.section.footer.opts.hl = "DashboardFooter"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
