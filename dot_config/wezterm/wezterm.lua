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

local base_font_size = 14
local wf_font_size = 10

if is_azusa then
    base_font_size = 22
    wf_font_size = 12
end

require("format")
require("status")
require("event")

config.color_scheme = "GitHub Dark"
config.window_background_opacity = 0.93
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
    local wsl_domain
    if is_human_rights then
        -- Home PC
        wsl_domain = "WSL:Ubuntu"
    else
        -- Work PC
        wsl_domain = "WSL:Ubuntu-20.04"
    end

    config.default_domain = wsl_domain

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

local function debug_log_print()
    --wezterm.log_info("Default hyperlink rules " .. wezterm.default_hyperlink_rules())
    --wezterm.log_info("Default ssh domains" .. wezterm.default_ssh_domains())
    --wezterm.log_info("Default wsl domains" .. wezterm.default_wsl_domains())
    wezterm.log_info("Config Dir " .. wezterm.config_dir)
    wezterm.log_info("Config file " .. wezterm.config_file)
    wezterm.log_info("Version " .. wezterm.version)
    wezterm.log_info("Exe dir " .. wezterm.executable_dir)
    wezterm.log_info("Hostname " .. hostname)
    wezterm.log_info("Running under wsl" .. tostring(is_wsl))
    config.debug_key_events = true
end

debug_log_print()

return config
