-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- import and apply modules to config
require("keybindings").apply_to_config(config)
require("font").apply_to_config(config)
require("settings").apply_to_config(config)
require("window_settings").apply_to_config(config)
require("theme").apply_to_config(config)

-- disabling keybindings for splitting windows and sessions in favor of tmux
-- require("splits-keybindings").apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
