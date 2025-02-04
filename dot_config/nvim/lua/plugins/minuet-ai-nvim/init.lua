---@type LazySpec
local spec = {
    "milanglacier/minuet-ai.nvim",
    --lazy = false,
    cmd = "Minuet",
    --keys = keys,
    dependencies = require("plugins.minuet-ai-nvim.dependencies"),
    opts = require("plugins.minuet-ai-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
