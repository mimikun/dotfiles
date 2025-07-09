---@type LazySpec
local spec = {
    "milanglacier/yarepl.nvim",
    --lazy = false,
    cmd = require("plugins.yarepl-nvim.cmds"),
    keys = require("plugins.yarepl-nvim.keys"),
    event = "VeryLazy",
    dependencies = require("plugins.yarepl-nvim.dependencies"),
    opts = require("plugins.yarepl-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
