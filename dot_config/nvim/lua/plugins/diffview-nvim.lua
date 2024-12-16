---@type LazySpec
local spec = {
    "sindrets/diffview.nvim",
    --lazy = false,
    cmd = require("plugins.configs.diffview-nvim.cmds"),
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require("plugins.configs.diffview-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
