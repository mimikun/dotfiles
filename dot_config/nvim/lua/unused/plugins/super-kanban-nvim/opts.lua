---@module 'superkanban'
---@type superkanban.Config
local opts = {
    icons = {
        -- Character for left edge of a list
        list_edge_left = "", -- ║
        -- Character for right edge of a list
        list_edge_right = "", -- ║
        -- Left decorative separator for elements
        bubble_edge_left = "", -- 
        -- Right decorative separator for elements
        bubble_edge_right = "", -- 
        -- Arrows
        arrow_left = "←",
        arrow_right = "→",
        arrow_up = "↑",
        arrow_down = "↓",
        -- Symbols for checkbox states in cards
        card_checkmarks = {
            ["empty_box"] = "☐",
            [" "] = " ",
            ["x"] = "✔",
        },
    },
}

return opts
