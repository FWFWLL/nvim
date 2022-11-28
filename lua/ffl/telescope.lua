local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local icons = require("ffl.icons")

telescope.setup {
	defaults = {
		prompt_prefix = icons.ui.ChevronRight .. " ",
		selection_caret = icons.ui.ChevronRight .. " ",
		path_display = {"smart"},
		file_ignore_patterns = {
			".git/",
			"target/",
			"docs/",
			"vendor/*",
			"%.lock",
			"__pycache__/*",
			"%.sqlite3",
			"%.ipynb",
			"node_modules/*",
			"%.jpg",
			"%.jpeg",
			"%.png",
			"%.svg",
			"%.otf",
			"%.ttf",
			"%.webp",
			".dart_tool/",
			".github/",
			".gradle/",
			".idea/",
			".settings/",
			".vscode/",
			"__pycache__/",
			"build/",
			"env/",
			"gradle/",
			"node_modules/",
			"%.pdb",
			"%.dll",
			"%.class",
			"%.exe",
			"%.cache",
			"%.ico",
			"%.pdf",
			"%.dylib",
			"%.jar",
			"%.docx",
			"%.met",
			"smalljre_*/*",
			".vale/",
			"%.burp",
			"%.mp4",
			"%.mkv",
			"%.rar",
			"%.zip",
			"%.7z",
			"%.tar",
			"%.bz2",
			"%.epub",
			"%.flac",
			"%.tar.gz",
		},
		mappings = {
			i = {
				["<ESC>"] = actions.close,
			},
			n = {
				["<ESC>"] = actions.close,
			},
		},
	},
}
