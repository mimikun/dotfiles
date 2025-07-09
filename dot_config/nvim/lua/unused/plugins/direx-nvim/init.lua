---@type LazySpec
local spec = {
    "brianhuster/direx.nvim",
    --lazy = false,
    cmd = require("plugins.direx-nvim.cmds"),
    opts = require("plugins.direx-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
