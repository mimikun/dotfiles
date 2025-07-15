---@type table
local opts = {
    builtin_marks = { ".", "<", ">", "^" },
    default_mappings = true,
    signs = true,
    cyclic = true,
    force_write_shada = false,
    refresh_interval = 250,
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
    excluded_filetypes = {},
    excluded_buftypes = {},
    mappings = {},
}

return opts
