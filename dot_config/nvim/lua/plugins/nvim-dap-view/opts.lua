---@type table
local opts = {
    winbar = {
        show = true,
        sections = {
            "watches",
            "exceptions",
            "breakpoints",
            "repl",
        },
        default_section = "watches",
    },
    windows = {
        height = 12,
    },
}

return opts
