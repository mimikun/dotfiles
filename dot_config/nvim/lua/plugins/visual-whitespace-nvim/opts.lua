---@type table
local opts = {
    enabled = false,
    match_types = {
        lead = false,
        trail = false,
    },
    list_chars = {
        lead = "‹",
        trail = "›",
    },
    ignore = {
        filetypes = {},
        buftypes = {},
    },
}

return opts
