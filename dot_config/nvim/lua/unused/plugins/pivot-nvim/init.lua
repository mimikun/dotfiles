---@type LazySpec
local spec = {
    "mattcookio/pivot.nvim",
    --lazy = false,
    cmd = require("plugins.pivot-nvim.cmds"),
    keys = require("plugins.pivot-nvim.keys"),
    opts = require("plugins.pivot-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
