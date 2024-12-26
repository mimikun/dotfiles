---@type LazySpec
local spec = {
    "saghen/blink.cmp",
    build = "cargo build --release",
    lazy = false,
    --event = "VeryLazy",
    dependencies = require("plugins.blink-cmp.dependencies"),
    opts = require("plugins.blink-cmp.opts"),
    --cond = false,
    --enabled = false,
}

return spec
