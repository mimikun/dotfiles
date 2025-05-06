-- ref: https://github.com/michaelbrusegard/dotfiles/blob/5acb063/modules/wezterm/config/wezterm.lua

-- Load wezterm core module
local wezterm = require("wezterm")

-- Load config.global module
local g = require("config.global")

-- Define log module
local M = {}

M.debug_log_print = function(config)
    wezterm.log_info("Home Dir: " .. g.home)
    wezterm.log_info("Config Dir: " .. g.config_dir)
    wezterm.log_info("Config file: " .. g.config_file)
    wezterm.log_info("Version: " .. g.version)
    wezterm.log_info("Exe dir: " .. g.exec_dir)
    wezterm.log_info("Hostname: " .. g.hostname)
    wezterm.log_info("Path sep: " .. g.path_sep)
    wezterm.log_info("Running under wsl: " .. tostring(g.is_wsl))
    config.debug_key_events = true
end

M.show_plugin_list = function()
    wezterm.log_info("Plugins: ")
    wezterm.log_info(wezterm.plugin.list())
end

M.update_all_plugins = function()
    wezterm.plugin.update_all()
end

M.reload_config = function()
    wezterm.reload_configuration()
end

-- Returns a table with ALL-configs
return M
