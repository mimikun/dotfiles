---@type LazySpec
local spec = {
    "waiting-for-dev/ergoterm.nvim",
    --lazy = false,
    cmd = require("plugins.ergoterm-nvim.cmds"),
    keys = require("plugins.ergoterm-nvim.keys"),
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec
