---@type LazySpec
local spec = {
    "ysmb-wtsg/in-and-out.nvim",
    --lazy = false,
    keys = require("plugins.in-and-out-nvim.keys"),
    opts = require("plugins.in-and-out-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
