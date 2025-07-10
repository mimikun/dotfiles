---@type LazySpec
local spec = {
    "yourusername/scaffolder.nvim",
    --lazy = false,
    cmd = require("plugins.nvim-scaffolder.cmds"),
    dependencies = require("plugins.nvim-scaffolder.dependencies"),
    opts = require("plugins.nvim-scaffolder.opts"),
    cond = false,
    enabled = false,
}

return spec
