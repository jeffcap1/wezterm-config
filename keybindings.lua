local wezterm = require("wezterm")
local act = wezterm.action

-- This is the module table that we will export
local module = {}

-- wezterm.on("update-right-status", function(window)
--   window:set_right_status(window:active_workspace())
-- end)

function module.apply_to_config(config)
	config.keys = {
		-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
		{ key = "LeftArrow", mods = "OPT", action = act.SendString("\x1bb") },

		-- Make Option-Right equivalent to Alt-f; forward-word
		{ key = "RightArrow", mods = "OPT", action = act.SendString("\x1bf") },

		-- Make Command-Left equivalent to Home; beginning of line
		{ key = "LeftArrow", mods = "SUPER", action = act.SendString("\001") },

		-- Make Command-Right equivalent to End; end of line
		{ key = "RightArrow", mods = "SUPER", action = act.SendString("\005") },

		-- Pane Split Closing
		{ key = "w", mods = "SUPER", action = act.CloseCurrentPane({ confirm = true }) },

		-- Closing Window
		{ key = "w", mods = "SUPER|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },

		-- Scrollback
		{ key = "k", mods = "CTRL|SHIFT", action = act.ClearScrollback("ScrollbackOnly") },
		{ key = "k", mods = "SUPER", action = act.ClearScrollback("ScrollbackAndViewport") },
	}

	config.mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	}
end

-- return our module table
return module
