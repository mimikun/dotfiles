---@type LazySpec
local spec = {
    "joshuavial/aider.nvim",
    --lazy = false,
    cmd = require("plugins.aider-nvim.cmds"),
    keys = require("plugins.aider-nvim.keys"),
    opts = require("plugins.aider-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
