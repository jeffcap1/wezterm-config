local wezterm = require("wezterm")

-- This is the module table that we will export
local module = {}

function module.apply_to_config(config)
  config.front_end = "WebGpu"
  config.line_height = 1.2
  -- config.use_fancy_tab_bar = false
  config.default_cursor_style = "BlinkingBar"
  config.adjust_window_size_when_changing_font_size = false
  config.hide_tab_bar_if_only_one_tab = true
  config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
  config.integrated_title_button_style = "Windows"
end

-- return our module table
return module
