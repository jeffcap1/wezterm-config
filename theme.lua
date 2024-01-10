local wezterm = require("wezterm")

-- This is the module table that we will export
local module = {}

function module.apply_to_config(config)
  config.color_scheme = "Catppuccin Macchiato"
  config.window_background_opacity = 0.95
  config.macos_window_background_blur = 15
end

-- return our module table
return module
