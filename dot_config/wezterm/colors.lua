local M = {}

-- カラースキームを GitHub Dark にする
M.color_scheme = "GitHub Dark"

-- 色の設定
local base_colors = {
    dark = "#172331",
    yellow = "#ffe64d",
}

M.colors = {
    cursor_bg = base_colors["yellow"],
    split = "#6fc3df",
    -- the foreground color of selected text
    selection_fg = base_colors["dark"],
    -- the background color of selected text
    selection_bg = base_colors["yellow"],
    tab_bar = {
        background = base_colors["dark"],
        -- The active tab is the one that has focus in the window
        active_tab = {
            bg_color = "aliceblue",
            fg_color = base_colors["dark"],
        },
    },
}

return M
