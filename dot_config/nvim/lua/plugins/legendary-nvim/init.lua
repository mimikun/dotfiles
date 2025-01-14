---@type LazySpec
local spec = {
    "mrjones2014/legendary.nvim",
    lazy = false,
    priority = 10000,
    cmd = require("plugins.legendary-nvim.cmds"),
    dependencies = { "kkharji/sqlite.lua" },
    opts = require("plugins.legendary-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
