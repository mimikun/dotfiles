---@type LazySpec
local spec = {
    "DestopLine/scratch-runner.nvim",
    --lazy = false,
    dependencies = { "folke/snacks.nvim" },
    opts = require("plugins.scratch-runner-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
