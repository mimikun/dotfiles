local wezterm = require("wezterm")

local global = {}
local os_name = wezterm.target_triple
local hostname = wezterm.hostname()
local is_wsl = wezterm.running_under_wsl()

-- NOTE: wezterm cannot get sysinfo
function global:is_human_rights()
    if hostname == "YutoWindows" then
        return true
    elseif hostname == "TanakaPC" then
        return false
    elseif hostname == "azusa" then
        return true
    else
        return false
    end
end

function global:load_variables()
    self.hostname = hostname
    self.is_intel_mac = os_name == "x86_64-apple-darwin"
    -- Apple Silicon
    self.is_m_mac = os_name == "aarch64-apple-darwin"
    self.is_linux = os_name == "x86_64-unknown-linux-gnu"
    self.is_windows = os_name == "x86_64-pc-windows-msvc"
    self.is_wsl = is_wsl
    self.is_azusa = hostname == "azusa"
    self.is_human_rights = global:is_human_rights()
    self.home = wezterm.home_dir
    self.config_dir = wezterm.config_dir
    self.config_file = wezterm.config_file
    self.version = wezterm.version
    self.exec_dir = wezterm.executable_dir
    self.path_sep = self.is_windows and "\\" or "/"
end

global:load_variables()

return global
