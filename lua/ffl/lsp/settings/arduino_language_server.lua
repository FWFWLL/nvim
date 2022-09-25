return {
	cmd = {
		"arduino-language-server",
		"-cli-config", "/home/ffl/.arduino15/arduino-cli.yaml",
		"-fqbn", "arduino:avr:uno",
		"-cli", "/home/ffl/.config/nvim/arduino-cli/arduino-cli",
		"-clangd", "/home/ffl/.local/share/nvim/mason/bin/clangd",
	},
}
