local wezterm = require("wezterm")
local mux = wezterm.mux

local module = {}

local show_bg = true
local img = nil

local function get_random_bgimg()
	local dir = wezterm.home_dir .. "/.config/wezterm/art"
	local res = io.popen('find "' .. dir .. '" -type f') or {}

	local imgs = {}
	for file in res:lines() do
		if file:match(".DS_Store$") then
			goto continue
		end
		table.insert(imgs, file)
		::continue::
	end

	math.randomseed(os.time())
	local img = imgs[math.random(#imgs)]
	wezterm.log_info("Selected background image: " .. img)
	return img
end

local function set_background(window, img)
	local overrides = window:get_config_overrides() or {}
	local bg_img = img or wezterm.home_dir .. "/.config/wezterm/art/master-sword-botw.jpg"

	-- The art is a bit too bright and colorful to be useful as a backdrop
	-- for text, so we're going to dim it down to 10% of its normal brightness
	local dimmer = { brightness = 0.1 }

	local base_color_bg = {
		source = {
			Color = "#24273a",
		},
		width = "100%",
		height = "100%",
		opacity = 0.85,
	}

	if show_bg then
		overrides.text_background_opacity = 0.9
		overrides.background = {
			-- This is the deepest/back-most layer. It will be rendered first
			base_color_bg,
			-- Subsequent layers are rendered over the top of each other
			{
				source = {
					File = bg_img,
				},
				hsb = dimmer,
				opacity = 0.5,
				horizontal_align = "Center",
			},
		}
	else
		overrides.text_background_opacity = 0.9
		base_color_bg.opacity = 0.85
		overrides.background = {
			base_color_bg,
		}
	end

	window:set_config_overrides(overrides)
end

wezterm.on("set-random-bgimg", function(window)
	show_bg = true
	img = get_random_bgimg()
	set_background(window, img)
end)

wezterm.on("toggle-bgimg-visible", function(window)
	if img ~= nil then
		show_bg = not show_bg
		set_background(window, img)
	else
		wezterm.log_info("No background image is set, skipping showing image")
	end
end)

function module.apply_to_config(config)
	config.keys = {
		{
			key = "b",
			mods = "CMD|SHIFT",
			action = wezterm.action.EmitEvent("toggle-bgimg-visible"),
		},
		{
			key = "r",
			mods = "CMD|SHIFT",
			action = wezterm.action.EmitEvent("set-random-bgimg"),
		},
	}
end

return module
