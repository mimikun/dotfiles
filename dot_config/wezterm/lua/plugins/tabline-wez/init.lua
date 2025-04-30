local wezterm = require("wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local battery = wezterm.plugin.require("https://github.com/rootiest/battery.wez")
battery.invert = true

return function(config)
    local options = require("plugins.tabline-wez.options")(config)
    local sections = require("plugins.tabline-wez.sections")(config, battery)
    local extensions = { "presentation" }

    tabline.setup({
        options = options,
        sections = sections,
        extensions = extensions,
    })
end
