local wezterm = require("wezterm")

-- This is the module table that we will export
local module = {}

function module.apply_to_config(config)
  config.front_end = "WebGpu"
  config.scrollback_lines = 10240
  config.automatically_reload_config = true
  config.default_cursor_style = "BlinkingBar"
  config.disable_default_quick_select_patterns = true
  config.disable_default_mouse_bindings = true
end

-- return our module table
return module
