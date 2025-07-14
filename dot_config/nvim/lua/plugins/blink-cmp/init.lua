---@type boolean
local use_blink_cmp = require("config.settings").use_blink_cmp

-- NOTE: if is_home, use nightly feature, otherwise use pre-compiled binary
---@type boolean
local is_home = require("config.global").is_home

---@type LazySpec
local spec = {
    "saghen/blink.cmp",
    --lazy = false,
    build = is_home and "cargo build --release" or false,
    version = is_home and false or "1.*",
    cmd = "BlinkCmp",
    event = "InsertEnter",
    dependencies = require("plugins.blink-cmp.dependencies"),
    opts = require("plugins.blink-cmp.opts"),
    cond = use_blink_cmp,
    enabled = use_blink_cmp,
}

return spec
