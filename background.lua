local wezterm = require 'wezterm';

local module = {}

local show_bg = true

wezterm.on('toggle-bgimg-visible', function(window)
  show_bg = not show_bg

  local overrides = window:get_config_overrides() or {}

  -- The art is a bit too bright and colorful to be useful as a backdrop
  -- for text, so we're going to dim it down to 10% of its normal brightness
  local dimmer = { brightness = 0.1 }

  local base_color_bg = {
    source = {
      Color = '#24273a'
    },
    width = "100%",
    height = "100%",
    opacity = 0.9
  }

  if show_bg then
    overrides.text_background_opacity = .8
    overrides.background = {
      -- This is the deepest/back-most layer. It will be rendered first
      base_color_bg,
      -- Subsequent layers are rendered over the top of each other
      {
        source = {
          File = wezterm.home_dir .. '/.config/wezterm/art/master-sword-botw.jpg',
        },
        hsb = dimmer,
        opacity = 0.5,
        horizontal_align = 'Center'
      },
    }
  else
    overrides.text_background_opacity = .9
    base_color_bg.opacity = .9
    overrides.background = {
      base_color_bg
    }
  end

  window:set_config_overrides(overrides)
end)

function module.apply_to_config(config)
  wezterm.action.EmitEvent 'toggle-bgimg-visible'

  -- Allows background image to be toggled on and off
  config.keys = {
    {
      key = "b",
      mods = "CMD|SHIFT",
      action = wezterm.action.EmitEvent 'toggle-bgimg-visible',
    },
  }
end

return module
