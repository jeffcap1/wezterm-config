local wezterm = require("wezterm")

-- This is the module table that we will export
local module = {}

local fonts = {
  {
    family = "Maple Mono",
    harfbuzz_features = {
      "calt",
      "liga",
      "dlig",
      "ss01",
      "ss02",
      "ss03",
      "ss04",
      "ss05",
      "ss06",
      "ss07",
      "ss08",
    },
  },
  {
    family = "Monaspace Neon",
    harfbuzz_features = {
      "calt",
      "liga",
      "dlig",
      "zero",
      "ss01",
      "ss02",
      "ss03",
      "ss04",
      "ss05",
      "ss06",
      "ss07",
      "ss08",
    },
  },
  {
    family = "Geist Mono",
    harfbuzz_features = {
      "calt",
      "liga",
      "dlig",
      "zero",
      "ss01",
      "ss02",
      "ss03",
      "ss04",
      "ss05",
      "ss06",
      "ss07",
      "ss08",
      "-ss09",
    },
  },
  {
    family = "MonoLisa",
    harfbuzz_features = {
      "calt",
      "liga",
      "zero",
      "-ss01",
      "ss02",
      "-ss03",
      "ss04",
      "ss05",
      "-ss06",
      "-ss07",
      "-ss08",
      "-ss09",
      "ss10",
      "ss11",
      "ss12",
      "-ss13",
      "ss14",
      "ss15",
      "ss16",
      "ss17",
      "ss18",
    },
  },
  {
    family = "Cartograph CF",
  },
}

--[[ local nerd_fonts = {
  {
    -- Fallback font with all the Nerdfont Symbols
    family = "JetBrainsMono Nerd Font Mono",
    scale = 1.25,
  },
  {
    -- Extra fallback
    family = "FiraCode Nerd Font Mono",
    -- scale = 1.25,
  },
} ]]

local emoji_fonts = {
  {
    family = "Apple Color Emoji",
  },
  {
    family = "Joypixels",
  },
}

function module.apply_to_config(config)
  -- config.font_size = 12.5
  config.font_size = 13
  config.line_height = 1.2

  config.font = wezterm.font_with_fallback({
    fonts[1],
    fonts[2],
    fonts[3],
    fonts[4],
    -- nerd_fonts[1],
    -- nerd_fonts[2],
    emoji_fonts[1],
    emoji_fonts[2],
  })
end

-- return our module table
return module
