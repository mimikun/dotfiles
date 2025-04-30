---@type table
local disabled_filetypes = {
    statusline = {
        "NvimTree",
        "alpha",
        "gitrebase",
        "gitcommit",
    },
    winbar = {
        "NvimTree",
        "alpha",
        "gitrebase",
        "gitcommit",
        "senpai_chat_log",
        "senpai_chat_input",
    },
}

---@type table
local options = {
    theme = "auto",
    icons_enabled = true,
    globalstatus = true,
    disabled_filetypes = disabled_filetypes,
    component_separators = {
        left = "",
        right = "",
    },
    section_separators = {
        left = "",
        right = "",
    },
}

return options
