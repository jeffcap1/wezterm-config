local wezterm = require("wezterm")

-- This is the module table that we will export
local module = {}

function module.apply_to_config(config)
  config.freetype_load_target = "Light"
  config.font = wezterm.font_with_fallback({
    {
      family = "Geist Mono",
    },
    {
      -- Fallback font with all the Nerdfont Symbols
      family = "JetBrainsMono Nerd Font Mono",
    },
    {
      -- Extra fallback
      family = "FiraCode Nerd Font Mono",
      scale = 0.9,
    },
  })
end

-- return our module table
return module
