---@type LazySpec
local spec = {
    "neo451/feed.nvim",
    --lazy = false,
    cmd = "Feed",
    dependencies = require("plugins.feed-nvim.dependencies"),
    opts = require("plugins.feed-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
