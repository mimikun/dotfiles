---@type LazySpec
local spec = {
    "simonmclean/triptych.nvim",
    --lazy = false,
    keys = require("plugins.triptych-nvim.keys"),
    event = "VeryLazy",
    dependencies = require("plugins.triptych-nvim.dependencies"),
    opts = require("plugins.triptych-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
