---@type table
local opts = {
    sort_order = "alphabetical", -- Options: 'alphabetical', 'custom'
    enable_logging = true, -- Enable or disable logging
    custom_sort = { -- Define your custom sort order
        "imports",
        "constants",
        "functions",
        "variables",
    },
}

return opts
