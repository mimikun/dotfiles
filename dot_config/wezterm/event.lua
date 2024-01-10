local wezterm = require("wezterm")

function DisableWindowDecorations(window, interval)
    if interval then
        wezterm.sleep_ms(interval)
    end

    local overrides = window:get_config_overrides() or {}
    overrides.window_decorations = nil
    window:set_config_overrides(overrides)
end

wezterm.on("window-focus-changed", function(window)
    if window:is_focused() then
        return
    end

    DisableWindowDecorations(window)
end)

local TITLE_BAR_DISPLAY_TIME = 3000

wezterm.on("show-title-bar", function(window)
    local overrides = window:get_config_overrides() or {}

    overrides.window_decorations = "TITLE | RESIZE"
    window:set_config_overrides(overrides)

    DisableWindowDecorations(window, TITLE_BAR_DISPLAY_TIME)
end)
