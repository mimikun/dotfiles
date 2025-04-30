local wezterm = require("wezterm")
local presentation = wezterm.plugin.require("https://gitlab.com/xarvex/presentation.wez")

local opts = {
    presentation = {
        enabled = true,
        keybind = { key = "p", mods = "CTRL|ALT" },
    },
    presentation_full = {
        enabled = true,
        keybind = { key = "p", mods = "CTRL|ALT|SHIFT" },
    },
    font_weight = "DemiBold",
    font_size_multiplier = 2.0,
}

return function(config)
    presentation.apply_to_config(config, opts)
end
