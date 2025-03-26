---@type LazySpec
local spec = {
    "Goose97/timber.nvim",
    version = "*",
    --lazy = false,
    keys = require("plugins.timber-nvim.keys"),
    event = "VeryLazy",
    dependencies = require("plugins.timber-nvim.dependencies"),
    opts = require("plugins.timber-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
