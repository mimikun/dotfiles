---@type LazySpec
local spec = {
    "josephburgess/nvumi",
    --lazy = false,
    cmd = require("plugins.nvumi.cmds"),
    keys = require("plugins.nvumi.keys"),
    dependencies = { "folke/snacks.nvim" },
    opts = require("plugins.nvumi.opts"),
    --cond = false,
    --enabled = false,
}

return spec
