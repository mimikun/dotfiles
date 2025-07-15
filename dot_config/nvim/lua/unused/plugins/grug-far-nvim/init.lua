---@type LazySpec
local spec = {
    "MagicDuck/grug-far.nvim",
    --lazy = false,
    cmd = "GrugFar",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require("plugins.grug-far-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
