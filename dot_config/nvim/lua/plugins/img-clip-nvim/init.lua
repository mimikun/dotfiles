---@type LazySpec
local spec = {
    "HakonHarnes/img-clip.nvim",
    --lazy = false,
    cmd = require("plugins.img-clip-nvim.cmds"),
    event = "VeryLazy",
    opts = require("plugins.img-clip-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
