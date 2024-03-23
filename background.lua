local wezterm = require 'wezterm';

local module = {}

-- The art is a bit too bright and colorful to be useful as a backdrop
-- for text, so we're going to dim it down to 10% of its normal brightness
local dimmer = { brightness = 0.1 }

function module.apply_to_config(config)
  config.text_background_opacity = .75
  config.background = {
    -- This is the deepest/back-most layer. It will be rendered first
    {
      source = {
        Color = '#24273a'
      },
      width = "100%",
      height = "100%",
      opacity = 0.85
    },
    {
      source = {
        File = wezterm.home_dir .. '/.config/wezterm/art/master-sword-botw.jpg',
      },
      -- The texture tiles vertically but not horizontally.
      -- When we repeat it, mirror it so that it appears "more seamless".
      -- An alternative to this is to set `width = "100%"` and have
      -- it stretch across the display
      repeat_x = 'Mirror',
      hsb = dimmer,
      opacity = 0.3,
      horizontal_align = 'Center'
    },
    -- Subsequent layers are rendered over the top of each other
  }
end

return module
