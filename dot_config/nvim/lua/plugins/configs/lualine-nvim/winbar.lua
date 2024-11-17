local component = require("plugins.configs.lualine-nvim.components")

---@type table
local winbar = {
    lualine_a = {},
    lualine_b = { component.special_notice },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
}

return winbar
