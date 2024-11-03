---@type table
local opts = {
    excluded_filetypes = {
        "cmp_docs",
        "cmp_menu",
        "noice",
        "prompt",
        "TelescopePrompt",
        "alpha",
    },
    handlers = {
        cursor = {
            symbols = { "⎺", "⎻", "⎼", "⎽" },
        },
        diagnostic = {
            signs = { "-", "=", "≡" },
        },
        gitsigns = {
            signs = {
                add = "│",
                change = "│",
                delete = "-",
            },
        },
        quickfix = {
            signs = { "-", "=", "≡" },
        },
    },
}

require("satellite").setup(opts)
