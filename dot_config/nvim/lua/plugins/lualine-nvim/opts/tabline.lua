local c = require("plugins.lualine-nvim.opts.components")

---@type table
local tabline = {
    lualine_a = { c.buffers },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "diff" },
    lualine_y = { "branch" },
    lualine_z = { "tabs" },
}

return tabline
