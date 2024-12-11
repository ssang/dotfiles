-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Dracula (Official)"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
    left = 32,
    right = 32,
    top = 40,
    bottom = 40,
}
config.window_background_image = './.wezterm/bg.png'
config.font = wezterm.font 'CaskaydiaCove NF'
config.font_size = 18

-- and finally, return the configuration to wezterm
return config