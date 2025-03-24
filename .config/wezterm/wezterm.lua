-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- font
-- config.font = wezterm.font("Iosevka Nerd Font")
-- config.font = wezterm.font("Ubuntu Mono Nerd Font")
config.font = wezterm.font("JetBrains Mono")
config.font_size = 16
config.cell_width = 1.0
config.line_height = 1.0

-- appearence
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.window_decorations = "TITLE"
-- config.color_scheme = "OneDark (base16)"
-- config.color_scheme = "Gruvbox dark, hard (base16)"
-- config.color_scheme = "GruvboxDarkHard"
-- config.color_scheme = "Tango"
config.colors = {
	background = "#181818",
	foreground = "#ffffff",
	cursor_bg = "#FFD700",
}
config.window_padding = {
	left = "0px",
	right = "0px",
	top = "0px",
	bottom = "0px",
}

-- key bindings
config.keys = {
	{ key = "K", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
	{ key = "J", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	{ key = "v", mods = "ALT", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "c", mods = "ALT", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
}

-- and finally, return the configuration to wezterm
return config
