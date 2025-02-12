---@type LazySpec
local spec = {
    "SmiteshP/nvim-navbuddy",
    --lazy = false,
    cmd = "Navbuddy",
    dependencies = require("plugins.nvim-navbuddy.dependencies"),
    opts = require("plugins.nvim-navbuddy.opts"),
    --cond = false,
    --enabled = false,
}

return spec
