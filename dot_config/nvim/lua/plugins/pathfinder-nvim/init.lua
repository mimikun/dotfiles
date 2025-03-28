---@type LazySpec
local spec = {
    "HawkinsT/pathfinder.nvim",
    --lazy = false,
    keys = require("plugins.pathfinder-nvim.keys"),
    opts = require("plugins.pathfinder-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
