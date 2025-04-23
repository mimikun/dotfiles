---@type LazySpec
local spec = {
    "Dan7h3x/LazyDo",
    branch = "main",
    --lazy = false,
    cmd = require("plugins.lazydo.cmds"),
    keys = require("plugins.lazydo.keys"),
    event = "VeryLazy",
    opts = require("plugins.lazydo.opts"),
    cond = false,
    enabled = false,
}

return spec
