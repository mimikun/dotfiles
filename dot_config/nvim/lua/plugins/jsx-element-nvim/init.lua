---@type LazySpec
local spec = {
    "mawkler/jsx-element.nvim",
    --lazy = false,
    ft = require("plugins.jsx-element-nvim.ft"),
    dependencies = require("plugins.jsx-element-nvim.dependencies"),
    opts = require("plugins.jsx-element-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
