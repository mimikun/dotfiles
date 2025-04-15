---@type LazySpec
local spec = {
    "y3owk1n/dotmd.nvim",
    --lazy = false,
    cmd = require("plugins.dotmd-nvim.cmds"),
    keys = require("plugins.dotmd-nvim.keys"),
    event = "VeryLazy",
    dependencies = require("plugins.dotmd-nvim.dependencies"),
    opts = require("plugins.dotmd-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
