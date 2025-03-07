---@type table
local opts = {
    exclude = {
        filenames = {
            "term://",
        },
        filetypes = {
            "lazygit",
            "NvimTree",
            "qf",
        },
    },
    sort = {
        -- "none" | "filename"
        type = "none",
        -- "asc" | "desc"
        direction = "asc",
    },
    view = {
        modified_icon = "󰛿",
        pinned_icon = "󰃀",
        window = {
            auto_resize = false,
            width = 35,
            focus_on_open = false,
        },
    },
}

return opts
