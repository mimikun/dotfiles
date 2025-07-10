---@type table
local sources = {
    path = {
        max_depth = 16,
        preview = true,
    },
    treesitter = {
        max_depth = 16,
    },
    lsp = {
        max_depth = 16,
        request = {
            ttl_init = 60,
            interval = 1000,
        },
    },
    markdown = {
        max_depth = 6,
        parse = {
            look_ahead = 200,
        },
    },
    terminal = {
        show_current = true,
    },
}

return sources
