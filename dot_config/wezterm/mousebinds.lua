local wezterm = require("wezterm")
local action = wezterm.action

return {
    mouse_bindings = {
        {
            event = { Down = { streak = 1, button = "Left" } },
            mods = "NONE",
            action = action.EmitEvent("show-title-bar"),
        },
    },
}
