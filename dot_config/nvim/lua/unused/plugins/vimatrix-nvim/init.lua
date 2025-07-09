---@type LazySpec
local spec = {
    "wolfwfr/vimatrix.nvim",
    --lazy = false,
    ft = require("plugins.vimatrix-nvim.ft"),
    cmd = require("plugins.vimatrix-nvim.cmds"),
    opts = require("plugins.vimatrix-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
