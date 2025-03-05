---@type table
local opts = {
    ---@type boolean
    always_show = false,
    ---@type string
    --base = "left",
    base = "right",
    --base = "buffer",
    ---@type number
    byte_limit = 1000000,
    ---@type string
    character = "",
    ---@type number
    column = 1,
    ---@type boolean
    consider_border = false,
    ---@type boolean
    current_only = false,
    ---@type table
    excluded_filetypes = {},
    ---@type boolean
    floating_windows = false,
    ---@type boolean
    hide_bar_for_insert = false,
    ---@type boolean
    hide_on_cursor_intersect = false,
    ---@type boolean
    hide_on_float_intersect = false,
    ---@type boolean
    hide_on_text_intersect = false,
    ---@type boolean
    hover = true,
    ---@type boolean
    include_end_region = false,
    ---@type number
    line_limit = 20000,
    ---@type string
    --mode = "simple",
    --mode = "virtual",
    --mode = "proper",
    mode = "auto",
    ---@type string
    mouse_primary = "left",
    --mouse_primary = "middle",
    --mouse_primary = "right",
    ---@type string
    --mouse_secondary = "left",
    --mouse_secondary = "middle",
    mouse_secondary = "right",
    ---@type boolean
    on_startup = true,
    ---@type number
    winblend = 50,
    ---@type number
    winblend_gui = 0,
    ---@type number
    zindex = 40,
}

return opts
