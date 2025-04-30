local wezterm = require("wezterm")

local global = {}
local os_name = wezterm.target_triple
local hostname = wezterm.hostname()

-- NOTE: wezterm cannot get sysinfo
global.check_human_rights = function()
    if hostname == "YutoWindows" then
        return true
    elseif hostname == "TanakaPC" then
        return false
    elseif hostname == "azusa" then
        return true
    elseif hostname == "Wakamo" then
        return true
    else
        return false
    end
end

global.hostname = hostname
global.is_intel_mac = os_name == "x86_64-apple-darwin"
-- Apple Silicon
global.is_m_mac = os_name == "aarch64-apple-darwin"
global.is_linux = os_name == "x86_64-unknown-linux-gnu"
global.is_windows = os_name == "x86_64-pc-windows-msvc"
global.is_wsl = wezterm.running_under_wsl()
global.is_azusa = hostname == "azusa"
global.is_human_rights = global:check_human_rights()
global.home = wezterm.home_dir
global.config_dir = wezterm.config_dir
global.config_file = wezterm.config_file
global.version = wezterm.version
global.exec_dir = wezterm.executable_dir
global.path_sep = global.is_windows and "\\" or "/"
global.SPACE_1 = " "
global.SPACE_3 = "   "

return global
