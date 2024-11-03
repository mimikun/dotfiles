---@type table
local opts = {
    filetypes_denylist = {
        "dirbuf",
        "dirvish",
        "fugitive",
    },
    -- sets regex case sensitivity
    case_insensitive_regex = false,
}

require("illuminate").configure(opts)
