---@type LazySpec
local spec = {
    "yuki-yano/smart-i.nvim",
    --lazy = false,
    keys = require("plugins.smart-i-nvim.keys"),
    --event = "VeryLazy",
    opts = require("plugins.smart-i-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
