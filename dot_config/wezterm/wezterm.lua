local wezterm = require("wezterm")
local global = require("global")
local keybinds = require("keybinds")
local mousebinds = require("mousebinds")
local kabegami = require("kabegami")
local lm = require("launchmenu")

local M = {}

if wezterm.config_builder then
    M = wezterm.config_builder()
end

local hostname = global.hostname
local is_azusa = global.is_azusa
local is_human_rights = global.is_human_rights

local kabegami_name
--kabegami_name = kabegami.get("butasan").nesoberi
kabegami_name = kabegami.get("azusa").kuroinu

local kabegami_path
kabegami_path = table.concat({ global.home, ".kabegami", "random", kabegami_name }, global.path_sep)

local font_size = {
    base = is_azusa and 22 or 14,
    window_frame = is_azusa and 12 or 10,
}

require("format")
require("status")
require("event")

-- appearance
M.color_scheme = "GitHub Dark"
M.window_background_opacity = 0.93

if is_human_rights then
    M.window_background_image = kabegami_path
    M.window_background_image_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 0.07,
    }
end

M.font = wezterm.font_with_fallback({
    -- FiraCode Nerd Font
    --{ family = "FiraCode Nerd Font Mono", weight = 450, stretch = "Normal", style = "Normal" },
    { family = "FiraCode Nerd Font Mono", weight = "Regular", stretch = "Normal", style = "Normal" },
    { family = "UDEV Gothic NF", weight = "Regular", stretch = "Normal", style = "Normal" },
    { family = "0xProto Nerd Font Mono", weight = "Regular", stretch = "Normal", style = "Normal" },
    { family = "Cica", weight = "Regular", stretch = "Normal", style = "Normal" },
    { family = "Cascadia Mono", weight = "Regular", stretch = "Normal", style = "Normal" },
    { family = "BIZ UDGothic", weight = "Regular", stretch = "Normal", style = "Normal" },
    { family = "Consolas", weight = "Regular", stretch = "Normal", style = "Normal" },
    { family = "MS Gothic", weight = "Regular", stretch = "Normal", style = "Normal" },
})
M.font_size = font_size.base
M.window_frame = {
    font = wezterm.font_with_fallback({ family = "Roboto", weight = "Bold" }),
    font_size = font_size.window_frame,
}
M.leader = keybinds.leader
M.keys = keybinds.keys
M.key_tables = keybinds.key_tables
M.mouse_bindings = mousebinds.mouse_bindings
M.disable_default_key_bindings = true
M.line_height = 1
M.use_ime = true
M.initial_rows = 30
M.initial_cols = 120
M.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- launch menu
if not is_azusa then
    if is_human_rights then
        M.default_domain = lm.wsl_domain
    else
        M.default_prog = { "pwsh.exe" }
    end

    M.launch_menu = lm.launch_menu
end

local function debug_log_print()
    --wezterm.log_info("Default hyperlink rules " .. wezterm.default_hyperlink_rules())
    --wezterm.log_info("Default ssh domains" .. wezterm.default_ssh_domains())
    --wezterm.log_info("Default wsl domains" .. wezterm.default_wsl_domains())
    wezterm.log_info("Home Dir " .. global.home)
    wezterm.log_info("Config Dir " .. global.config_dir)
    wezterm.log_info("Config file " .. global.config_file)
    wezterm.log_info("Version " .. global.version)
    wezterm.log_info("Exe dir " .. global.exec_dir)
    wezterm.log_info("Hostname " .. hostname)
    wezterm.log_info("Path sep " .. global.path_sep)
    wezterm.log_info("Running under wsl" .. tostring(global.is_wsl))
    M.debug_key_events = true
end

debug_log_print()

return M
