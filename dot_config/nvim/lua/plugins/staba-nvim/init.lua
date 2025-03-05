---@type LazySpec
local spec = {
    "tar80/staba.nvim",
    --lazy = false,
    dependencies = require("plugins.staba-nvim.dependencies"),
    opts = require("plugins.staba-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
