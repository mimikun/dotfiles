---@type table
local opts = {
    open_on_startup = false,
    hijack_netrw = true,
    show_hidden = true,
    cursorline = true,
    tree = {
        space_after_icon = " ",
        space_after_connector = " ",
        connector_space = "  ",
        connector_last = "└─",
        connector_middle = "├─",
        vertical_line = "│",
    },
    icons = {
        title = " ",
        directory = "",
        empty_dir = "",
    },
}

return opts
