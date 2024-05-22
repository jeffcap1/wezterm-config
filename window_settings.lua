local wezterm = require("wezterm")
local mux = wezterm.mux

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
	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	config.integrated_title_button_style = "Windows"
	-- config.initial_cols = 200
	-- config.initial_rows = 50
	config.window_padding = {
		left = "0.75cell",
		right = "0.5cell",
		top = "0.25cell",
		bottom = 0,
	}
end

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {
		position = { x = "5%", y = "5%" },
		width = 200,
		height = 50,
	})

	local gui_window = window:gui_window()
	gui_window:perform_action(wezterm.action.EmitEvent("set-random-bgimg"), window:active_pane())
end)

-- wezterm.on("gui-attached", function()
--   -- maximize all displayed windows on startup and set background image
--   local workspace = mux.get_active_workspace()
--   for _, window in ipairs(mux.all_windows()) do
--     if window:get_workspace() == workspace then
--       local gui_window = window:gui_window()
--       gui_window:maximize()
--       gui_window:perform_action(wezterm.action.EmitEvent("set-random-bgimg"), window:active_pane())
--     end
--   end
-- end)

return module
