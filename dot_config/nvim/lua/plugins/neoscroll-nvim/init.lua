---@type LazySpec
local spec = {
    "karb94/neoscroll.nvim",
    --lazy = false,
    cmd = require("plugins.neoscroll-nvim.cmds"),
    event = "BufRead",
    opts = require("plugins.neoscroll-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
