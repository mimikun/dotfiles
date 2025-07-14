---@module 'blink.cmp'
---@type blink.cmp.AppearanceConfig
local appearance = {
    ---@string 'mono' | 'normal'
    nerd_font_variant = "mono",
    kind_icons = require("plugins.blink-cmp.opts.appearance.kind_icons"),
}

return appearance
