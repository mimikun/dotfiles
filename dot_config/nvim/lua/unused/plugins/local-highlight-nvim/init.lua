---@type LazySpec
local spec = {
    "tzachar/local-highlight.nvim",
    --lazy = false,
    cmd = require("plugins.local-highlight-nvim.cmds"),
    dependencies = { "folke/snacks.nvim" },
    opts = require("plugins.local-highlight-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
