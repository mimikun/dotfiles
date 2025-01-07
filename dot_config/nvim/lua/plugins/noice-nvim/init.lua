---@type table
local cmds = {
    "Noice",
    "NoiceLast",
    "NoiceDisable",
}

---@type LazySpec
local spec = {
    "folke/noice.nvim",
    --lazy = false,
    event = "VeryLazy",
    cmd = cmds,
    dependencies = require("plugins.noice-nvim.dependencies"),
    opts = require("plugins.noice-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
