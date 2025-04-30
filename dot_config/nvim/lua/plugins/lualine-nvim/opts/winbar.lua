local c = require("plugins.lualine-nvim.opts.components")

---@type table
local winbar = {
    lualine_a = {},
    lualine_b = { c.special_notice },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
}

return winbar
