-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Import modules
local font = require("font")
local keybindings = require("keybindings")
local settings = require("settings")
local window_settings = require("window_settings")
local theme = require("theme")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- apply modules that were imported
font.apply_to_config(config)
keybindings.apply_to_config(config)
settings.apply_to_config(config)
window_settings.apply_to_config(config)
theme.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
