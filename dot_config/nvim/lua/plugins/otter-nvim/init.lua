---@type LazySpec
local spec = {
    "jmbuhr/otter.nvim",
    --lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = require("plugins.otter-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
