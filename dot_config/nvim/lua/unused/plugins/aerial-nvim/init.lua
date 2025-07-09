---@type LazySpec
local spec = {
    "stevearc/aerial.nvim",
    --lazy = false,
    cmd = require("plugins.aerial-nvim.cmds"),
    keys = require("plugins.aerial-nvim.keys"),
    dependencies = require("plugins.aerial-nvim.dependencies"),
    opts = require("plugins.aerial-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
