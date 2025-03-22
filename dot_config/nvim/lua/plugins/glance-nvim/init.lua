---@type LazySpec
local spec = {
    "dnlhc/glance.nvim",
    --lazy = false,
    cmd = "Glance",
    keys = require("plugins.glance-nvim.keys"),
    opts = require("plugins.glance-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
