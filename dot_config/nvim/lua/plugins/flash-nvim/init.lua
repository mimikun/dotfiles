---@type LazySpec
local spec = {
    "folke/flash.nvim",
    --lazy = false,
    keys = require("plugins.flash-nvim.keys"),
    event = "VeryLazy",
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec
