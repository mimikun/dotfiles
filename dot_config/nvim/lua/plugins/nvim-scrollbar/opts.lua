---@type table
local opts = {
    show = true,
    show_in_active_only = false,
    set_highlights = true,
    folds = 1000,
    max_lines = false,
    hide_if_all_visible = false,
    throttle_ms = 100,
    handle = {
        text = " ",
        blend = 30,
    },
    marks = {
        Cursor = { text = "•" },
        Search = { text = { "-", "=" } },
        Error = { text = { "-", "=" } },
        Warn = { text = { "-", "=" } },
        Info = { text = { "-", "=" } },
        Hint = { text = { "-", "=" } },
        Misc = { text = { "-", "=" } },
        GitAdd = { text = "┆" },
        GitChange = { text = "┆" },
        GitDelete = { text = "▁" },
    },
    excluded_buftypes = {
        "terminal",
    },
    excluded_filetypes = {
        "dropbar_menu",
        "dropbar_menu_fzf",
        "DressingInput",
        "cmp_docs",
        "cmp_menu",
        "noice",
        "prompt",
        "TelescopePrompt",
    },
    handlers = {
        gitsigns = false,
        handle = true,
        search = false,
    },
}

return opts
