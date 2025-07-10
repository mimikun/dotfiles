---@type LazySpec
local spec = {
    "chrisgrieser/nvim-scissors",
    --lazy = false,
    cmd = require("plugins.nvim-scissors.cmds"),
    keys = require("plugins.nvim-scissors.keys"),
    dependencies = require("plugins.nvim-scissors.dependencies"),
    opts = require("plugins.nvim-scissors.opts"),
    cond = false,
    enabled = false,
}

return spec
