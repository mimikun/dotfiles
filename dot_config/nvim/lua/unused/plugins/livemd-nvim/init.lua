---@type LazySpec
local spec = {
    "idossha/LiveMD.nvim",
    --lazy = false,
    ft = require("plugins.livemd-nvim.ft"),
    cmd = require("plugins.livemd-nvim.cmds"),
    keys = require("plugins.livemd-nvim.keys"),
    opts = require("plugins.livemd-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
