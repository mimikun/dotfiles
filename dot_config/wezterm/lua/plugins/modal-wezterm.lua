local wezterm = require("wezterm")
local modal = wezterm.plugin.require("https://github.com/MLFlexer/modal.wezterm")

return function(config)
    modal.apply_to_config(config)
end
