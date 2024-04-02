local wezterm = require("wezterm")
local global = require("global")
local keybinds = require("keybinds")
local mousebinds = require("mousebinds")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

local hostname = global.hostname
local is_wsl = global.is_wsl
local is_azusa = global.is_azusa
local is_human_rights = global.is_human_rights
local home = global.home
local config_dir = global.config_dir
local config_file = global.config_file
local version = global.version
local exec_dir = global.exec_dir
local path_sep = global.path_sep

local base_font_size = is_azusa and 22 or 14
local wf_font_size = is_azusa and 12 or 10

local kabegami_name = "Azusa_by_96ENU.png"

require("format")
require("status")
require("event")

-- appearance
config.color_scheme = "GitHub Dark"
config.window_background_opacity = 0.93

if is_human_rights then
    config.window_background_image = table.concat({ home, ".kabegami", "random", kabegami_name }, path_sep)
    config.window_background_image_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 0.07,
    }
end

-- font
config.font = wezterm.font_with_fallback({
    { family = "Cica", weight = "Regular", stretch = "Normal", style = "Normal" },
    { family = "FiraCode Nerd Font Mono", weight = 450, stretch = "Normal", style = "Normal" },
})
config.font_size = base_font_size

config.window_frame = {
    font = wezterm.font({ family = "Roboto", weight = "Bold" }),
    font_size = wf_font_size,
}
config.leader = keybinds.leader
config.keys = keybinds.keys
config.key_tables = keybinds.key_tables
config.mouse_bindings = mousebinds.mouse_bindings
config.disable_default_key_bindings = true
config.line_height = 1
config.use_ime = true
config.initial_rows = 30
config.initial_cols = 120
config.window_decorations = "RESIZE"

if not is_azusa then
    local wsl_domain = is_human_rights and "WSL:Ubuntu" or "WSL:Ubuntu-20.04"

    if is_human_rights then
        config.default_domain = wsl_domain
    else
        config.default_prog = { "pwsh.exe" }
    end

    config.launch_menu = {
        {
            label = "WSL Ubuntu",
            domain = {
                DomainName = wsl_domain,
            },
        },
        {
            label = "Windows PowerShell v5",
            domain = {
                DomainName = "local",
            },
            args = { "powershell.exe" },
        },
        {
            label = "Windows PowerShell v7",
            domain = {
                DomainName = "local",
            },
            args = { "pwsh.exe" },
        },
        {
            label = "Windows cmd.exe",
            domain = {
                DomainName = "local",
            },
        },
        {
            label = "nyagos - Nihongo Yet Another GOing Shell",
            domain = {
                DomainName = "local",
            },
            args = { "nyagos.exe" },
        },
    }
end

-- icons
local nf = wezterm.nerdfonts

local cod_zoom_in = nf.cod_zoom_in
local oct_zoom_in = nf.oct_zoom_in
local md_magnify = nf.md_magnify
local md_magnify_plus = nf.md_magnify_plus
local fa_expand = nf.fa_expand
local md_arrow_expand = nf.md_arrow_expand
local md_arrow_expand_all = nf.md_arrow_expand_all
local md_alphabetical = nf.md_alphabetical
local md_alphabetical_variant = nf.md_alphabetical_variant
local md_keyboard = nf.md_keyboard
local md_keyboard_outline = nf.md_keyboard_outline
local md_keyboard_variant = nf.md_keyboard_variant
local fa_keyboard_o = nf.fa_keyboard_o
local md_syllabary_hiragana = nf.md_syllabary_hiragana
local md_monitor = nf.md_monitor
local custom_folder_open = nf.custom_folder_open
local fa_folder_open = nf.fa_folder_open
local fa_folder_open_o = nf.fa_folder_open_o
local md_folder_open = nf.md_folder_open
local md_folder_open_outline = nf.md_folder_open_outline
local oct_file_directory = nf.oct_file_directory
local oct_file_directory_fill = nf.oct_file_directory_fill
local oct_file_directory_open_fill = nf.oct_file_directory_open_fill
local cod_folder_opened = nf.cod_folder_opened
local cod_calendar = nf.cod_calendar
local fa_calendar = nf.fa_calendar
local fa_calendar_o = nf.fa_calendar_o
local md_calendar = nf.md_calendar
local oct_calendar = nf.oct_calendar
local md_clock = nf.md_clock
local md_clock_outline = nf.md_clock_outline
local seti_clock = nf.seti_clock
local oct_clock = nf.oct_clock
local oct_clock_fill = nf.oct_clock_fill
local fa_clock_o = nf.fa_clock_o
local fa_battery_three_quarters = nf.fa_battery_three_quarters
local md_battery_outline = nf.md_battery_outline
local md_battery_0 = nf.md_battery_outline
local md_battery_10 = nf.md_battery_10
local md_battery_20 = nf.md_battery_20
local md_battery_30 = nf.md_battery_30
local md_battery_40 = nf.md_battery_40
local md_battery_50 = nf.md_battery_50
local md_battery_60 = nf.md_battery_60
local md_battery_70 = nf.md_battery_70
local md_battery_80 = nf.md_battery_80
local md_battery_90 = nf.md_battery_90
local md_battery_100 = nf.md_battery
local md_battery = nf.md_battery
local md_battery_charging_outline = nf.md_battery_charging_outline
local md_battery_charging_0 = nf.md_battery_charging_outline
local md_battery_charging_10 = nf.md_battery_charging_10
local md_battery_charging_20 = nf.md_battery_charging_20
local md_battery_charging_30 = nf.md_battery_charging_30
local md_battery_charging_40 = nf.md_battery_charging_40
local md_battery_charging_50 = nf.md_battery_charging_50
local md_battery_charging_60 = nf.md_battery_charging_60
local md_battery_charging_70 = nf.md_battery_charging_70
local md_battery_charging_80 = nf.md_battery_charging_80
local md_battery_charging_90 = nf.md_battery_charging_90
local md_battery_charging_100 = nf.md_battery_charging_100
local md_console = nf.md_console
local md_console_line = nf.md_console_line

local function debug_log_print()
    --wezterm.log_info("Default hyperlink rules " .. wezterm.default_hyperlink_rules())
    --wezterm.log_info("Default ssh domains" .. wezterm.default_ssh_domains())
    --wezterm.log_info("Default wsl domains" .. wezterm.default_wsl_domains())
    wezterm.log_info("Home Dir " .. home)
    wezterm.log_info("Config Dir " .. config_dir)
    wezterm.log_info("Config file " .. config_file)
    wezterm.log_info("Version " .. version)
    wezterm.log_info("Exe dir " .. exec_dir)
    wezterm.log_info("Hostname " .. hostname)
    wezterm.log_info("Path sep " .. path_sep)
    wezterm.log_info("Running under wsl" .. tostring(is_wsl))
    config.debug_key_events = true
end

local function debug_icon_print()
    -- zoomed 🔎,
    wezterm.log_info("cod_zoom_in " .. cod_zoom_in)
    wezterm.log_info("oct_zoom_in " .. oct_zoom_in)
    wezterm.log_info("md_magnify " .. md_magnify)
    wezterm.log_info("md_magnify_plus " .. md_magnify_plus)
    wezterm.log_info("fa_expand " .. fa_expand)
    wezterm.log_info("md_arrow_expand " .. md_arrow_expand)
    wezterm.log_info("md_arrow_expand_all " .. md_arrow_expand_all)
    ---- Left Status,
    -- HEADER_KEY_NORMAL ,
    wezterm.log_info("md_alphabetical " .. md_alphabetical)
    wezterm.log_info("md_alphabetical_variant " .. md_alphabetical_variant)
    -- HEADER_LEADER ,
    wezterm.log_info("md_keyboard " .. md_keyboard)
    wezterm.log_info("md_keyboard_outline " .. md_keyboard_outline)
    wezterm.log_info("md_keyboard_variant " .. md_keyboard_variant)
    wezterm.log_info("fa_keyboard_o " .. fa_keyboard_o)
    -- tab title icon ,
    wezterm.log_info("md_console " .. md_console)
    wezterm.log_info("md_console_line " .. md_console_line)
    -- HEADER BATTERY charging,
    wezterm.log_info("md_battery_outline " .. md_battery_outline)
    wezterm.log_info("md_battery_0 " .. md_battery_0)
    wezterm.log_info("md_battery_10 " .. md_battery_10)
    wezterm.log_info("md_battery_20 " .. md_battery_20)
    wezterm.log_info("md_battery_30 " .. md_battery_30)
    wezterm.log_info("md_battery_40 " .. md_battery_40)
    wezterm.log_info("md_battery_50 " .. md_battery_50)
    wezterm.log_info("md_battery_60 " .. md_battery_60)
    wezterm.log_info("md_battery_70 " .. md_battery_70)
    wezterm.log_info("md_battery_80 " .. md_battery_80)
    wezterm.log_info("md_battery_90 " .. md_battery_90)
    wezterm.log_info("md_battery_100 " .. md_battery_100)
    wezterm.log_info("md_battery " .. md_battery)
    wezterm.log_info("md_battery_charging_outline " .. md_battery_charging_outline)
    wezterm.log_info("md_battery_charging_0 " .. md_battery_charging_0)
    wezterm.log_info("md_battery_charging_10 " .. md_battery_charging_10)
    wezterm.log_info("md_battery_charging_20 " .. md_battery_charging_20)
    wezterm.log_info("md_battery_charging_30 " .. md_battery_charging_30)
    wezterm.log_info("md_battery_charging_40 " .. md_battery_charging_40)
    wezterm.log_info("md_battery_charging_50 " .. md_battery_charging_50)
    wezterm.log_info("md_battery_charging_60 " .. md_battery_charging_60)
    wezterm.log_info("md_battery_charging_70 " .. md_battery_charging_70)
    wezterm.log_info("md_battery_charging_80 " .. md_battery_charging_80)
    wezterm.log_info("md_battery_charging_90 " .. md_battery_charging_90)
    wezterm.log_info("md_battery_charging_100 " .. md_battery_charging_100)
    -- HEADER_IME あ,
    wezterm.log_info("md_syllabary_hiragana " .. md_syllabary_hiragana)
    ---- Right Status,
    -- HEADER_HOST ,
    wezterm.log_info("md_monitor " .. md_monitor)
    -- HEADER_CWD ,
    wezterm.log_info("custom_folder_open " .. custom_folder_open)
    wezterm.log_info("fa_folder_open " .. fa_folder_open)
    wezterm.log_info("fa_folder_open_o " .. fa_folder_open_o)
    wezterm.log_info("md_folder_open " .. md_folder_open)
    wezterm.log_info("md_folder_open_outline " .. md_folder_open_outline)
    wezterm.log_info("oct_file_directory " .. oct_file_directory)
    wezterm.log_info("oct_file_directory_fill " .. oct_file_directory_fill)
    wezterm.log_info("oct_file_directory_open_fill " .. oct_file_directory_open_fill)
    wezterm.log_info("cod_folder_opened " .. cod_folder_opened)
    -- HEADER_DATE 󱪺,
    wezterm.log_info("cod_calendar " .. cod_calendar)
    wezterm.log_info("fa_calendar " .. fa_calendar)
    wezterm.log_info("fa_calendar_o " .. fa_calendar_o)
    wezterm.log_info("md_calendar " .. md_calendar)
    wezterm.log_info("oct_calendar " .. oct_calendar)
    -- HEADER_TIME ,
    wezterm.log_info("md_clock " .. md_clock)
    wezterm.log_info("md_clock_outline " .. md_clock_outline)
    wezterm.log_info("seti_clock " .. seti_clock)
    wezterm.log_info("oct_clock " .. oct_clock)
    wezterm.log_info("oct_clock_fill " .. oct_clock_fill)
    wezterm.log_info("fa_clock_o " .. fa_clock_o)
    -- HEADER_BATTERY ,
    wezterm.log_info("fa_battery_three_quarters " .. fa_battery_three_quarters)
end

debug_log_print()

return config
