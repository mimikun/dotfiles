---@type LazySpec
local spec = {
    "ThePrimeagen/refactoring.nvim",
    lazy = false,
    cmd = "Refactor",
    keys = require("plugins.refactoring-nvim.keys"),
    dependencies = require("plugins.refactoring-nvim.dependencies"),
    opts = require("plugins.refactoring-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
