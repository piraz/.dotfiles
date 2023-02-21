local wezterm = require("wezterm")
local env_os = require("env.os")

local font_size = 10
if env_os.is_mac() then
    font_size = 12
end

return {
    font = wezterm.font "JetBrains Mono",
    font_size = font_size,
    color_scheme = "SeaShells",
    window_background_opacity = 0.88,
}

