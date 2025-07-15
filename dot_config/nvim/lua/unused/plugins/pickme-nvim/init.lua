---@type LazySpec
local spec = {
    "2KAbhishek/pickme.nvim",
    --lazy = false,
    cmd = "PickMe",
    event = "VeryLazy",
    dependencies = require("plugins.pickme-nvim.dependencies"),
    opts = require("plugins.pickme-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
