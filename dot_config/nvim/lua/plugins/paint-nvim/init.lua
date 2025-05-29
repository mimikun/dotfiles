---@type LazySpec
local spec = {
    "shazow/paint.nvim",
    --lazy = false,
    cmd = require("plugins.paint-nvim.cmds"),
    keys = require("plugins.paint-nvim.keys"),
    opts = {},
    cond = false,
    enabled = false,
}

return spec
