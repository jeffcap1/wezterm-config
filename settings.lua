local wezterm = require("wezterm")

-- This is the module table that we will export
local module = {}

function module.apply_to_config(config)
	config.term = "wezterm"
	config.max_fps = 120
	config.front_end = "WebGpu"
	config.scrollback_lines = 3500
	config.automatically_reload_config = true
	config.disable_default_quick_select_patterns = true

	-- cursor
	config.animation_fps = 120
	config.cursor_blink_ease_in = "EaseOut"
	config.cursor_blink_ease_out = "EaseOut"
	config.default_cursor_style = "BlinkingBar"
	config.cursor_blink_rate = 650
end

-- return our module table
return module
