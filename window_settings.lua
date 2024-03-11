local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
  -- tabs
  config.enable_tab_bar = true
  config.hide_tab_bar_if_only_one_tab = true
  config.use_fancy_tab_bar = true
  config.tab_bar_at_bottom = false
  config.enable_scroll_bar = false

  -- window
  config.adjust_window_size_when_changing_font_size = false
  config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
  config.integrated_title_button_style = "Windows"
  config.initial_cols = 80
  config.initial_rows = 25
  config.window_padding = {
    left = '0.75cell',
    right = '0.5cell',
    top = '0.25cell',
    bottom = 0,
  }
  -- config.window_padding = {
  --   left = 30,
  --   right = 30,
  --   top = 30,
  --   bottom = 30,
  -- }
end

return module
