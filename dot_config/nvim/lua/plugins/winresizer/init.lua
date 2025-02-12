---@type LazySpec
local spec = {
    "simeji/winresizer",
    --lazy = false,
    cmd = "WinResizerStartResize",
    keys = require("plugins.winresizer.keys"),
    init = function()
        vim.g.winresizer_enable = 1
        vim.g.winresizer_gui_enable = 0
        vim.g.winresizer_finish_with_escape = 1
        vim.g.winresizer_vert_resize = 10
        vim.g.winresizer_horiz_resize = 3
        vim.g.winresizer_start_key = "<C-e>"
        vim.g.winresizer_gui_start_key = "<C-a>"
        vim.g.winresizer_keycode_left = 104 --h
        vim.g.winresizer_keycode_right = 108 --l
        vim.g.winresizer_keycode_down = 106 --j
        vim.g.winresizer_keycode_up = 107 --k
        vim.g.winresizer_keycode_focus = 102 --f
        vim.g.winresizer_keycode_move = 109 --m
        vim.g.winresizer_keycode_resize = 114 --r
        vim.g.winresizer_keycode_mode = 101 --e
        vim.g.winresizer_keycode_finish = 13 --<Enter>
        vim.g.winresizer_keycode_cancel = 113 --q
    end,
    -- TODO: parts of winbuf-manage head
    --cond = false,
    --enabled = false,
}

return spec
