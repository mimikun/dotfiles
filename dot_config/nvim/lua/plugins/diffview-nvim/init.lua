---@type LazySpec
local spec = {
    "sindrets/diffview.nvim",
    --lazy = false,
    cmd = require("plugins.diffview-nvim.cmds"),
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require("plugins.diffview-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
