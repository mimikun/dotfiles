-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.color_scheme = "github_dark"
--'C:\Program Files\WezTerm\colors'
--config.color_scheme_dirs = { "C\/\:\/Program Files\/WezTerm\/colors' }

-- default is WSL
config.default_prog = { "wsl.exe", "--distribution", "Ubuntu-20.04", "--cd", "~" }

-- font
-- C:\USERS\YUTO\APPDATA\LOCAL\MICROSOFT\WINDOWS\FONTS\FIRA CODE RETINA NERD FONT COMPLETE MONO.TTF, DirectWrite
config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = 450, stretch = "Normal", style = "Normal" })

-- IME
config.use_ime = true

return config
