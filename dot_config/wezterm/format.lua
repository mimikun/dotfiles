local global = require("global")
local SPACE_1 = global.SPACE_1
local wezterm = require("wezterm")
local nf = wezterm.nerdfonts
local console_icon = nf.md_console_line .. SPACE_1
local zoom_icon = nf.md_magnify_plus_outline .. SPACE_1

local function BaseName(s)
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-window-title", function(tab)
    return BaseName(tab.active_pane.foreground_process_name)
end)

local HEADER = console_icon

local SYMBOL_COLOR = { "#ffb2cc", "#a4a4a4" }
local FONT_COLOR = { "#dddddd", "#888888" }
local BACK_COLOR = "#2d2d2d"
local HOVER_COLOR = "#434343"

wezterm.on("format-tab-title", function(tab, hover)
    local index = tab.is_active and 1 or 2

    local bg = hover and HOVER_COLOR or BACK_COLOR
    local zoomed = tab.active_pane.is_zoomed and zoom_icon or " "

    return {
        { Foreground = { Color = SYMBOL_COLOR[index] } },
        { Background = { Color = bg } },
        { Text = HEADER .. zoomed },

        { Foreground = { Color = FONT_COLOR[index] } },
        { Background = { Color = bg } },
        { Text = BaseName(tab.active_pane.title) },
    }
end)
