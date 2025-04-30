local is_azusa = require("config.global").is_azusa

local font_size = {
    base = is_azusa and 22 or 14,
    window_frame = is_azusa and 12 or 10,
}

local function fonts(config)
    config.font = require("wezterm").font_with_fallback({
        --{ family = "FiraCode Nerd Font Mono", weight = 450, stretch = "Normal", style = "Normal" },
        { family = "UDEV Gothic NF", weight = "Regular", stretch = "Normal", style = "Normal" },
        { family = "FiraCode Nerd Font Mono", weight = "Regular", stretch = "Normal", style = "Normal" },
        { family = "0xProto Nerd Font Mono", weight = "Regular", stretch = "Normal", style = "Normal" },
        { family = "Cica", weight = "Regular", stretch = "Normal", style = "Normal" },
        { family = "Cascadia Mono", weight = "Regular", stretch = "Normal", style = "Normal" },
        { family = "BIZ UDGothic", weight = "Regular", stretch = "Normal", style = "Normal" },
        { family = "Consolas", weight = "Regular", stretch = "Normal", style = "Normal" },
        { family = "MS Gothic", weight = "Regular", stretch = "Normal", style = "Normal" },
    })
    config.font_size = font_size.base
    config.window_frame = {
        font = require("wezterm").font_with_fallback({
            { family = "UDEV Gothic NF", weight = "Bold", stretch = "Normal", style = "Normal" },
            { family = "FiraCode Nerd Font Mono", weight = "Bold", stretch = "Normal", style = "Normal" },
            { family = "0xProto Nerd Font Mono", weight = "Bold", stretch = "Normal", style = "Normal" },
            { family = "Cica", weight = "Bold", stretch = "Normal", style = "Normal" },
            { family = "Cascadia Mono", weight = "Bold", stretch = "Normal", style = "Normal" },
            { family = "Roboto", weight = "Bold", stretch = "Normal", style = "Normal" },
        }),
        font_size = font_size.window_frame,
    }
end

return fonts
