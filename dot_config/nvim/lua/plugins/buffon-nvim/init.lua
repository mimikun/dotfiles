---@type LazySpec
local spec = {
    "francescarpi/buffon.nvim",
    --lazy = false,
    dependencies = require("plugins.buffon-nvim.dependencies"),
    opts = require("plugins.buffon-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
