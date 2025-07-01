---@type LazySpec
local spec = {
    "nwiizo/marp.nvim",
    --lazy = false,
    ft = "markdown",
    cmd = require("plugins.marp-nvim.cmds"),
    opts = require("plugins.marp-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
