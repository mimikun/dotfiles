---@type LazySpec
local spec = {
    "atomicptr/BufClose.nvim",
    --lazy = false,
    cmd = require("plugins.bufclose-nvim.cmds"),
    opts = require("plugins.bufclose-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
