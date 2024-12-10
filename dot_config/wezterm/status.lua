local global = require("global")
local wezterm = require("wezterm")

local SPACE_1 = global.SPACE_1
local SPACE_3 = global.SPACE_3
local nf = wezterm.nerdfonts

local DEFAULT_FG = { Color = "#9a9eab" }
local DEFAULT_BG = { Color = "#333333" }

-- Left icons
local normal_key_icon = nf.md_alphabetical_variant .. SPACE_1
local leader_key_icon = nf.md_keyboard_outline .. SPACE_1
local ime_icon = nf.md_syllabary_hiragana .. SPACE_1

-- Right icons
local host_icon = nf.md_monitor .. SPACE_1
local date_icon = nf.md_calendar_month .. SPACE_1
local cwd_icon = nf.md_folder_open .. SPACE_1
local time_icon = nf.md_clock_outline .. SPACE_1
local battery_icon = nf.fa_battery_three_quarters .. SPACE_1

-- Left Status
local HEADER_KEY_NORMAL = { Foreground = DEFAULT_FG, Text = normal_key_icon }
local HEADER_LEADER = { Foreground = { Color = "#ffffff" }, Text = leader_key_icon }
local HEADER_IME = { Foreground = DEFAULT_FG, Text = ime_icon }

local function AddIcon(elems, icon)
    table.insert(elems, { Foreground = icon.Foreground })
    table.insert(elems, { Background = DEFAULT_BG })
    table.insert(elems, { Text = SPACE_1 .. icon.Text .. SPACE_3 })
end

local function GetKeyboard(elems, window)
    if window:leader_is_active() then
        AddIcon(elems, HEADER_LEADER)
        return
    end

    AddIcon(elems, window:composition_status() and HEADER_IME or HEADER_KEY_NORMAL)
end

local function LeftUpdate(window)
    local elems = {}
    GetKeyboard(elems, window)
    window:set_left_status(wezterm.format(elems))
end

-- Right Status
local HEADER_HOST = { Foreground = { Color = "#75b1a9" }, Text = host_icon }
local HEADER_CWD = { Foreground = { Color = "#92aac7" }, Text = cwd_icon }
local HEADER_DATE = { Foreground = { Color = "#ffccac" }, Text = date_icon }
local HEADER_TIME = { Foreground = { Color = "#bcbabe" }, Text = time_icon }
local HEADER_BATTERY = { Foreground = { Color = "#dfe166" }, Text = battery_icon }

local function AddElement(elems, header, str)
    table.insert(elems, { Foreground = header.Foreground })
    table.insert(elems, { Background = DEFAULT_BG })
    table.insert(elems, { Text = header.Text .. SPACE_1 })

    table.insert(elems, { Foreground = DEFAULT_FG })
    table.insert(elems, { Background = DEFAULT_BG })
    table.insert(elems, { Text = str .. SPACE_3 })
end

local function GetHostAndCwd(elems, pane)
    local uri = pane:get_current_working_dir()

    if not uri then
        return
    end

    local cwd_uri = uri:sub(8)
    local slash = cwd_uri:find("/")

    if not slash then
        return
    end

    local host = cwd_uri:sub(1, slash - 1)
    local dot = host:find("[.]")

    AddElement(elems, HEADER_HOST, dot and host:sub(1, dot - 1) or host)
    AddElement(elems, HEADER_CWD, cwd_uri:sub(slash))
end

local function GetDate(elems)
    local day_of_week_ja = { "日", "月", "火", "水", "木", "金", "土" }
    local wday = os.date("*t").wday
    local wday_ja = string.format("(%s)", day_of_week_ja[wday])
    local date = wezterm.strftime("%Y年%m月%d日 " .. wday_ja)
    AddElement(elems, HEADER_DATE, date)
end

local function GetTime(elems)
    -- disable clock when human rights are being violated
    if not global.is_human_rights() then
        return
    end

    local time = wezterm.strftime("%H:%M:%S")
    AddElement(elems, HEADER_TIME, time)
end

-- selene: allow(unused_variable)
---@diagnostic disable-next-line
local function GetBatteryWithIcon(elems)
    local bat = ""

    for _, b in ipairs(wezterm.battery_info()) do
        local battery_state_of_charge = b.state_of_charge * 100
        local battery_charge_icon = ""
        if battery_state_of_charge >= 90 then
            battery_charge_icon = nf.md_battery .. SPACE_1
        elseif battery_state_of_charge >= 80 then
            battery_charge_icon = nf.md_battery_90 .. SPACE_1
        elseif battery_state_of_charge >= 70 then
            battery_charge_icon = nf.md_battery_80 .. SPACE_1
        elseif battery_state_of_charge >= 60 then
            battery_charge_icon = nf.md_battery_70 .. SPACE_1
        elseif battery_state_of_charge >= 50 then
            battery_charge_icon = nf.md_battery_60 .. SPACE_1
        elseif battery_state_of_charge >= 40 then
            battery_charge_icon = nf.md_battery_50 .. SPACE_1
        elseif battery_state_of_charge >= 30 then
            battery_charge_icon = nf.md_battery_40 .. SPACE_1
        elseif battery_state_of_charge >= 20 then
            battery_charge_icon = nf.md_battery_30 .. SPACE_1
        elseif battery_state_of_charge >= 10 then
            battery_charge_icon = nf.md_battery_20 .. SPACE_1
        else
            battery_charge_icon = nf.md_battery_outline .. SPACE_1
        end

        local HEADER_BATTERY_ICON = { Foreground = { Color = "#dfe166" }, Text = battery_charge_icon }
        bat = string.format("%s%.0f%% ", battery_state_of_charge)
        AddElement(elems, HEADER_BATTERY_ICON, bat)
    end
end

local function GetBattery(elems, window)
    if not window:get_dimensions().is_full_screen then
        return
    end

    for _, b in ipairs(wezterm.battery_info()) do
        AddElement(elems, HEADER_BATTERY, string.format("%.0f%%", b.state_of_charge * 100))
    end
end

local function RightUpdate(window, pane)
    local elems = {}

    GetHostAndCwd(elems, pane)
    GetDate(elems)
    GetTime(elems)
    GetBattery(elems, window)

    window:set_right_status(wezterm.format(elems))
end

wezterm.on("update-status", function(window, pane)
    LeftUpdate(window)
    RightUpdate(window, pane)
end)
