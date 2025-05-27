---@type LazySpec
local spec = {
    "jfryy/keytrail.nvim",
    --lazy = false,
    cmd = require("plugins.keytrail-nvim.cmds"),
    keys = require("plugins.keytrail-nvim.keys"),
    dependencies = require("plugins.keytrail-nvim.dependencies"),
    opts = require("plugins.keytrail-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
