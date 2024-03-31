local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.scrollback_lines = 4000
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

--- Hyperlink Rules ---

config.hyperlink_rules = wezterm.default_hyperlink_rules()

--- Keybinds ---

config.keys = {
	{
		key = "F11",
		-- mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

--- Color Scheme ---

-- config.color_scheme = "Galaxy"
config.color_scheme = "GitHub Dark"

--- Windows-specific config ---
-- NOTE: File location should be \Users\<username>\.wezterm.lua
if package.config:sub(1, 1) == "\\" then
	config.default_prog = { "ubuntu2204.exe" }
end

return config
