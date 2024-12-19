---@type table
local dependencies = {
    --"rafamadriz/friendly-snippets",
    { "L3MON4D3/LuaSnip", version = "v2.*" },
}

---@type LazySpec
local spec = {
    "saghen/blink.cmp",
    --version = "v0.*",
    build = "cargo build --release",
    --lazy = false,
    --cmd = "CMDNAME",
    --keys = "",
    --event = "VeryLazy",
    --dependencies = dependencies,
    opts = require("plugins.blink-cmp.opts"),
    --cond = false,
    --enabled = false,
}

return spec
