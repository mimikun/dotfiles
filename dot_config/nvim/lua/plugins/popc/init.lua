---@type LazySpec
local spec = {
    "yehuohan/popc",
    --lazy = false,
    cmd = require("plugins.popc.cmds"),
    event = "VeryLazy",
    opts = require("plugins.popc.opts"),
    cond = false,
    enabled = false,
}

return spec
