local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.enable_wayland = true
config.front_end = "OpenGL"

-- config.font = wezterm.font("IosevkaTerm Nerd Font")
-- config.font_size = 18
-- config.font = wezterm.font("Ubuntu Mono Nerd Font")
-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("Maple Mono NF")
config.font_size = 15
config.cell_width = 1.0
config.line_height = 1.0

config.enable_tab_bar = false
config.enable_scroll_bar = false
config.window_decorations = "NONE"
-- config.color_scheme = "OneDark (base16)"
config.color_scheme = "Gruvbox dark, hard (base16)"
-- config.color_scheme = "GruvboxDarkHard"
-- config.color_scheme = "Tango"
-- config.colors = {
-- 	background = "#181818",
-- 	foreground = "#ffffff",
-- 	cursor_bg = "#FFD700",
-- }
config.window_padding = {
	left = "0px",
	right = "0px",
	top = "0px",
	bottom = "0px",
}

config.keys = {
	-- { key = "K", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
	-- { key = "J", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	{ key = "v", mods = "ALT", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "c", mods = "ALT", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
}

return config
