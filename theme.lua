local wezterm = require("wezterm")

-- This is the module table that we will export
local module = {}

local active_tab = {
	bg_color = "#bc93f9",
	fg_color = "#191724",
}

local inactive_tab = {
	bg_color = "#191724",
	fg_color = "#6e6a86",
}

function module.apply_to_config(config)
	config.color_scheme = "Catppuccin Macchiato"

	-- command palette adjustments
	config.command_palette_bg_color = "#151521"
	config.command_palette_fg_color = "#b5b9c2"

	-- window adjustments
	config.window_background_opacity = 0.95
	config.macos_window_background_blur = 20

	-- window color overrides
	config.window_frame = {
		active_titlebar_bg = "#191724",
		inactive_titlebar_bg = "#191724",
	}

	config.colors = {
		tab_bar = {
			background = "#191724",
			active_tab = active_tab,
			inactive_tab = inactive_tab,
			inactive_tab_hover = active_tab,
			new_tab = inactive_tab,
			new_tab_hover = active_tab,
			inactive_tab_edge = "#6e6a86", -- (Fancy tab bar only)
		},
	}
end

-- return our module table
return module
