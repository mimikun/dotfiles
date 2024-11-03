---@type table
local opts = {
    side = "right",
    hide_statusline = true,
    sections = {
        "datetime",
        "git",
        "diagnostics",
    },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
}

require("sidebar-nvim").setup(opts)
