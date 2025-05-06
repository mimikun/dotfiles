---@type LazySpec
local spec = {
    "magnusriga/markdown-tools.nvim",
    --lazy = false,
    ft = require("plugins.makrdown-tools-nvim.ft"),
    cmd = require("plugins.makrdown-tools-nvim.cmds"),
    keys = require("plugins.makrdown-tools-nvim.keys"),
    --event = "VeryLazy",
    dependencies = require("plugins.makrdown-tools-nvim.dependencies"),
    opts = require("plugins.markdown-tools.opts"),
    cond = false,
    enabled = false,
}

return spec
