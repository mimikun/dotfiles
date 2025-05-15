---@type LazySpec
local spec = {
    "Goose97/alternative.nvim",
    --lazy = false,
    keys = require("plugins.alternative-nvim.keys"),
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = require("plugins.alternative-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
