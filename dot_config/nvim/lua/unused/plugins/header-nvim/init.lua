---@type LazySpec
local spec = {
    "attilarepka/header.nvim",
    --lazy = false,
    cmd = require("plugins.header-nvim.cmds"),
    keys = require("plugins.header-nvim.keys"),
    opts = require("plugins.header-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
