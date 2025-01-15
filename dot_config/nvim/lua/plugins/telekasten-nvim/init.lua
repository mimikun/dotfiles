---@type LazySpec
local spec = {
    "renerocksai/telekasten.nvim",
    --lazy = false,
    cmd = "Telekasten",
    keys = require("plugins.telekasten-nvim.keys"),
    dependencies = require("plugins.telekasten-nvim.dependencies"),
    opts = require("plugins.telekasten-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
