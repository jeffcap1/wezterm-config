local wezterm = require 'wezterm'

-- This is the module table that we will export
local module = {}

function module.apply_to_config(config)
  config.front_end = "WebGpu"
  config.line_height = 1.2
  config.adjust_window_size_when_changing_font_size = false
  config.hide_tab_bar_if_only_one_tab = true
  config.default_cursor_style = 'BlinkingBar'
end

-- return our module table
return module
