---@type LazySpec
local spec = {
    "houz42/markmark.nvim",
    --lazy = false,
    ft = require("plugins.markmark-nvim.ft"),
    cmds = require("plugins.markmark-nvim.cmds"),
    keys = require("plugins.markmark-nvim.keys"),
    opts = {},
    cond = false,
    enabled = false,
}

return spec
