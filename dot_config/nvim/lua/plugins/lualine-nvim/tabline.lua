---@type table
local tabline = {
    lualine_a = {
        {
            "buffers",
            symbols = {
                modified = "_󰷥",
                alternate_file = " ",
                directory = " ",
            },
        },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "diff" },
    lualine_y = { "branch" },
    lualine_z = { "tabs" },
}

return tabline
