---@type LazySpec
local spec = {
    "baketnk/treeporter.nvim",
    --lazy = false,
    dependencies = require("plugins.treeporter-nvim.dependencies"),
    opts = require("plugins.treeporter-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
