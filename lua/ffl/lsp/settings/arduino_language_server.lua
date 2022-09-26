local home = os.getenv("HOME")

return {
	cmd = {
		"arduino-language-server",
		"-cli-config", home .. "/.arduino15/arduino-cli.yaml",
		"-fqbn", "arduino:avr:uno",
		"-cli", home .. "/.config/nvim/arduino-cli/arduino-cli",
		"-clangd", home .. "/.local/share/nvim/mason/bin/clangd",
	},
}
