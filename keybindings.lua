local wezterm = require 'wezterm'
local act = wezterm.action

-- This is the module table that we will export
local module = {}

local function split_pane(direction)
  return act.SplitPane {
    direction = direction,
    size = { Percent = 50 },
  }
end

function module.apply_to_config(config)
  config.keys = {
    -- Mimic Global Keybinding to Hide WezTerm
    { key = 'Space', mods = 'CTRL|SHIFT|ALT|SUPER', action = act.HideApplication },

    -- Toggle pane being the full screen
    { key = 'Enter', mods = 'SUPER|SHIFT', action = act.TogglePaneZoomState },

    -- Pane Splits
    { key = 'k', mods = 'SUPER|ALT', action = split_pane('Up') },
    { key = 'j', mods = 'SUPER|ALT', action = split_pane('Down') },
    { key = 'h', mods = 'SUPER|ALT', action = split_pane('Left') },
    { key = 'l', mods = 'SUPER|ALT', action = split_pane('Right') },

    -- Pane Split Navigating
    { key = 'k', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Up' },
    { key = 'j', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Down' },
    { key = 'h', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Right' },

    -- Pane Split Adjust Size
    { key = 'k', mods = 'SUPER|SHIFT|ALT', action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'j', mods = 'SUPER|SHIFT|ALT', action = act.AdjustPaneSize { 'Down', 5 } },
    { key = 'h', mods = 'SUPER|SHIFT|ALT', action = act.AdjustPaneSize { 'Left', 5 } },
    { key = 'l', mods = 'SUPER|SHIFT|ALT', action = act.AdjustPaneSize { 'Right', 5 } },

    -- Pane Split Closing
    { key = 'w', mods = 'SUPER', action = act.CloseCurrentPane { confirm = true } },

    -- Closing Window
    { key = 'w', mods = 'SUPER|SHIFT', action = act.CloseCurrentTab { confirm = true } },
  }
end

-- return our module table
return module
