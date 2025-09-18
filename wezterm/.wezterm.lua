local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.cursor_blink_rate = 0
config.initial_cols = 120
config.initial_rows = 28
config.window_decorations = "RESIZE"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 18
config.color_scheme = "Tokyo Night Moon"
config.enable_tab_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
