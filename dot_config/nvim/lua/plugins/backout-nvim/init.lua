---@type LazySpec
local spec = {
    "AgusDOLARD/backout.nvim",
    --lazy = false,
    keys = require("backout-nvim").keys,
    opts = require("backout-nvim").opts,
    cond = false,
    enabled = false,
}

return spec
