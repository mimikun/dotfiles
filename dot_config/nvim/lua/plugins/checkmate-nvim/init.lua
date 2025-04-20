---@type LazySpec
local spec = {
    "bngarren/checkmate.nvim",
    --lazy = false,
    cmd = require("plugins.checkmate-nvim.cmds"),
    keys = require("plugins.checkmate-nvim.keys"),
    opts = require("plugins.checkmate-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
