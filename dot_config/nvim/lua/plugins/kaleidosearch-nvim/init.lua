---@type LazySpec
local spec = {
    "hamidi-dev/kaleidosearch.nvim",
    --lazy = false,
    cmd = require("plugins.kaleidosearch-nvim.cmds"),
    keys = require("plugins.kaleidosearch-nvim.keys"),
    dependencies = require("plugins.kaleidosearch-nvim.dependencies"),
    opts = {},
    cond = false,
    enabled = false,
}

return spec
