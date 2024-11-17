---@type LazySpec
local spec = {
    "gen740/SmoothCursor.nvim",
    --lazy = false,
    cmds = require("plugins.configs.smoothcursor-nvim.cmds"),
    event = "BufEnter",
    opts = require("plugins.configs.smoothcursor-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
