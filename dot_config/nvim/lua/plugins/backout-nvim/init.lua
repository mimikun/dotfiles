---@type LazySpec
local spec = {
    "AgusDOLARD/backout.nvim",
    --lazy = false,
    keys = require("plugins.backout-nvim.keys"),
    opts = require("plugins.backout-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
