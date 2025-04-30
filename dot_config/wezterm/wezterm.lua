-- ref: https://github.com/michaelbrusegard/dotfiles/blob/5acb063/modules/wezterm/config/wezterm.lua

-- Load wezterm core module
local wezterm = require("wezterm")

-- Define path sep
local path_sep = (wezterm.target_triple:find("windows")) and "\\" or "/"

-- Base directories
local dirs = {
    lua = wezterm.config_dir .. path_sep .. "lua",
    plugins = wezterm.config_dir .. path_sep .. "plugins",
}

-- Add Search paths
local search_paths = {
    dirs.lua .. path_sep .. "?.lua",
    dirs.lua .. path_sep .. "?" .. path_sep .. "init.lua",
    dirs.plugins .. path_sep .. "?.lua",
    dirs.plugins .. path_sep .. "?" .. path_sep .. "init.lua",
}

-- Expand package.path
package.path = package.path .. ";" .. table.concat(search_paths, ";")

-- Create a special type table object
local config = wezterm.config_builder and wezterm.config_builder() or {}

-- Load global module
local g = require("config.global")

-- NOTE: Define safe_require function
local function safe_require(module_name)
    local success, module = pcall(require, module_name)
    if success and type(module) == "function" then
        return module(config)
    elseif not success then
        wezterm.log_info("Failed to load " .. module_name)
        return config
    end
end

-- NOTE: Load some Configs
-- Load color settings
safe_require("config.colors")

-- Load appearance settings
safe_require("config.appearance")

-- Load window settings
safe_require("config.window")

-- Load font settings
safe_require("config.fonts")

-- Load keyboard settings
safe_require("config.keyboard")

-- Load mouse settings
safe_require("config.mouse")

-- Load default program settings
safe_require("config.programs")

-- Load kabegami settings, if only `is_human_rights=true`
if g.is_human_rights then
    safe_require("config.kabegami")
end

-- Load Launcher-menu settings, if only `hostname!=azusa`
if not g.is_azusa then
    safe_require("config.menu")
end

-- NOTE: Load some Plugins
safe_require("plugins.battery-wez")
-- XXX: I don't know how to use it
--safe_require("plugins.modal-wezterm")
safe_require("plugins.presentation-wez")
safe_require("plugins.tabline-wez")

-- NOTE: Load some utils
-- Debug Log print module
local success, log = pcall(require, "utils.log")
if success then
    log.debug_log_print(config)
else
    wezterm.log_info("Failed to load utils.log")
end

-- Returns a table with ALL-configs
return config
