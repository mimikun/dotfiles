local wezterm = require("wezterm")
local g = require("config.global")
local is_not_windows = not g.is_windows
local is_human_rights = g.is_human_rights

local nf = wezterm.nerdfonts

local SPACE = "  "
local normal_key_icon = SPACE .. nf.md_alphabetical_variant .. SPACE
local leader_key_icon = SPACE .. nf.md_keyboard_outline .. SPACE
local ime_icon = SPACE .. nf.md_syllabary_hiragana .. SPACE

local function convertWeekdayToJapanese(dateString)
    -- English weekday abbrs and Japanese weekday abbrs
    local weekdays = {
        ["Sun"] = "日",
        ["Mon"] = "月",
        ["Tue"] = "火",
        ["Wed"] = "水",
        ["Thu"] = "木",
        ["Fri"] = "金",
        ["Sat"] = "土",
    }
    -- Extract and convert the day of the week from the date string
    local result = dateString:gsub("%((%a+)%)", function(weekday)
        return "(" .. (weekdays[weekday] or weekday) .. ")"
    end)

    return result
end

local function key_state(window)
    if window:leader_is_active() then
        return leader_key_icon
    elseif window:composition_status() then
        return ime_icon
    else
        return normal_key_icon
    end
end

return function(config, battery)
    return {
        tabline_a = {
            key_state,
        },
        tabline_b = { "mode" },
        tabline_c = {},
        tab_active = {
            -- index number
            "index",
            {
                "parent",
                padding = 0,
            },
            -- separator
            "/",
            {
                "cwd",
                padding = { left = 0, right = 1 },
            },
            {
                "zoomed",
                padding = 0,
            },
        },
        tab_inactive = {
            -- index number
            "index",
            {
                "process",
                padding = { left = 0, right = 1 },
            },
        },
        tabline_x = {
            {
                "ram",
                cond = function()
                    return is_not_windows
                end,
            },
            {
                "cpu",
                cond = function()
                    return is_not_windows
                end,
            },
        },
        tabline_y = {
            -- date
            {
                "datetime",
                style = "%Y年%m月%d日(%a)",
                fmt = convertWeekdayToJapanese,
            },
            -- time
            {
                "datetime",
                style = "%H:%M:%S",
                cond = function()
                    return is_human_rights
                end,
            },
        },
        tabline_z = {
            --{
            --battery.get_battery_icons,
            --cond = function()
            --return g.is_azusa
            --end,
            --},
        },
    }
end
