---@type LazySpec
local spec = {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require("plugins.configs.snacks-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
