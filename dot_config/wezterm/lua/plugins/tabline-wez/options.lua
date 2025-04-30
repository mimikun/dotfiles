local wezterm = require("wezterm")
local nf = wezterm.nerdfonts

---@type table
local seps = {
    section = {
        --left = nf.pl_left_hard_divider,
        left = "",
        --right = nf.pl_right_hard_divider,
        right = "",
    },
    component = {
        --left = nf.pl_left_soft_divider,
        left = "",
        --right = nf.pl_right_soft_divider,
        right = "",
    },
    tab = {
        --left = nf.pl_left_hard_divider,
        left = "▎",
        --right = nf.pl_right_hard_divider,
        right = "",
    },
}

return function(config)
    return {
        icons_enabled = true,
        theme = config.color_scheme,
        tabs_enabled = true,
        theme_overrides = {},
        section_separators = {
            left = seps.section.left,
            right = seps.section.right,
        },
        component_separators = {
            left = seps.component.left,
            right = seps.component.right,
        },
        tab_separators = {
            left = seps.tab.left,
            right = seps.tab.right,
        },
    }
end
