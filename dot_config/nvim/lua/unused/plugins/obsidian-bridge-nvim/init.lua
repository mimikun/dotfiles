---@type LazySpec
local spec = {
    "oflisback/obsidian-bridge.nvim",
    --lazy = false,
    cmd = require("plugins.obsidian-bridge-nvim.cmds"),
    event = require("plugins.obsidian-bridge-nvim.events"),
    dependencies = require("plugins.obsidian-bridge-nvim.dependencies"),
    opts = require("plugins.obsidian-bridge-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
