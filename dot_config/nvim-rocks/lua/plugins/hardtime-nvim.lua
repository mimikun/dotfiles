---@type table
local opts = {
    disable_mouse = false,
    hint = true,
    notification = true,
    allow_different_key = false,
    enabled = true,
    disabled_filetypes = {
        "qf",
        "netrw",
        "NvimTree",
        "lazy",
        "mason",
        "oil",
    },
}

require("hardtime").setup(opts)
