local wezterm = require("wezterm")
local battery = wezterm.plugin.require("https://github.com/rootiest/battery.wez")

return function(config)
    battery.invert = true -- Optionally invert the color brightness
    battery.apply_to_config(config) -- Optionally apply the necessary config settings
end
