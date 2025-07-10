---@type LazySpec
local spec = {
    "gwydion67/headwind.nvim",
    --lazy = false,
    cmd = require("plugins.headwind-nvim.cmds"),
    keys = require("plugins.headwind-nvim.keys"),
    opts = require("plugins.headwind-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
