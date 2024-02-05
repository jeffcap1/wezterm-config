local wezterm = require("wezterm")

-- This is the module table that we will export
local module = {}

function module.apply_to_config(config)
	config.front_end = "WebGpu"
	config.enable_scroll_bar = false
	config.scrollback_lines = 10240
	config.automatically_reload_config = true
	config.default_cursor_style = "BlinkingBar"
	-- config.term = "wezterm" --"xterm-256color"
end

-- return our module table
return module
