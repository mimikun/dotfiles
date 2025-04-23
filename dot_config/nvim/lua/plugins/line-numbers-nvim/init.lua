---@type LazySpec
local spec = {
    "shrynx/line-numbers.nvim",
    --lazy = false,
    cmd = require("plugins.line-numbers-nvim.cmds"),
    opts = require("plugins.line-numbers-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
