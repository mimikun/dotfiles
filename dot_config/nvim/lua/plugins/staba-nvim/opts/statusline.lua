local components = require("plugins.staba-nvim.opts.components")

---@type table
local statusline = {
    active = {
        left = {
            "staba_logo",
            "search_count",
            "noice_mode",
            components.git_signs,
        },
        middle = {},
        right = {
            "%<",
            "diagnostics",
            "encoding",
            "position",
        },
    },
    inactive = {
        left = {},
        middle = {
            "devicon",
            "filename",
            "%*",
        },
        right = {},
    },
}

return statusline
