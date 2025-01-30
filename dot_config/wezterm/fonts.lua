local M = {}

local is_azusa = require("global").is_azusa

M.size = {
    base = is_azusa and 22 or 14,
    window_frame = is_azusa and 12 or 10,
}

M.fonts = {
    -- TODO: it
    base = {
        { family = "Cica", weight = "Regular", stretch = "Normal", style = "Normal" },
        { family = "FiraCode Nerd Font Mono", weight = 450, stretch = "Normal", style = "Normal" },
        -- BuiltIn fonts
        --"JetBrains Mono",
        --"Noto Color Emoji",
        --"Symbols Nerd Font Mono",
    },
    -- TODO: it
    window_frame = {
        { family = "Roboto", weight = "Bold" },
    },
}

return M
