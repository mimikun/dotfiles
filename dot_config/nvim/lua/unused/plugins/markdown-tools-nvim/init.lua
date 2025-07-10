---@type LazySpec
local spec = {
    "magnusriga/markdown-tools.nvim",
    --lazy = false,
    ft = require("plugins.markdown-tools-nvim.ft"),
    cmd = require("plugins.markdown-tools-nvim.cmds"),
    keys = require("plugins.markdown-tools-nvim.keys"),
    --event = "VeryLazy",
    dependencies = require("plugins.markdown-tools-nvim.dependencies"),
    opts = require("plugins.markdown-tools-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
