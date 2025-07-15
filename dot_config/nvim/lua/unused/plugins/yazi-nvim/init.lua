---@type LazySpec
local spec = {
    "mikavilpas/yazi.nvim",
    --lazy = false,
    cmd = "Yazi",
    keys = require("plugins.yazi-nvim.keys"),
    event = "VeryLazy",
    opts = require("plugins.yazi-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
