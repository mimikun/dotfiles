---@type LazySpec
local spec = {
    "Bekaboo/dropbar.nvim",
    --lazy = false,
    keys = require("plugins.dropbar-nvim.keys"),
    dependencies = require("plugins.dropbar-nvim.dependencies"),
    opts = require("plugins.dropbar-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
