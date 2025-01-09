---@type LazySpec
local spec = {
    "gen740/SmoothCursor.nvim",
    --lazy = false,
    cmds = require("plugins.smoothcursor-nvim.cmds"),
    event = "BufEnter",
    opts = require("plugins.smoothcursor-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
