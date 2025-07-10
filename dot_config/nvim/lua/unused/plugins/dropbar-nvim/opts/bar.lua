---@type table
local bar = {
    attach_events = {
        "BufWinEnter",
        "BufWritePost",
    },
    update_debounce = 32,
    update_events = {
        win = {
            "CursorMoved",
            "WinResized",
        },
        buf = {
            "BufModifiedSet",
            "FileChangedShellPost",
            "TextChanged",
            "ModeChanged",
        },
        global = {
            "DirChanged",
            "VimResized",
        },
    },
    hover = true,
    padding = {
        left = 1,
        right = 1,
    },
    pick = {
        pivots = "abcdefghijklmnopqrstuvwxyz",
    },
    truncate = true,
}

return bar
