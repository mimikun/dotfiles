---@type LazySpec
local spec = {
    "mikavilpas/yazi.nvim",
    --lazy = false,
    cmd = "Yazi",
    keys = require("plugins.configs.yazi-nvim.keys"),
    event = "VeryLazy",
    opts = require("plugins.configs.yazi-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
