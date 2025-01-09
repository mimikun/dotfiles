---@type boolean
local cond = require("config.settings").use_blink_cmp

-- NOTE: if is_home, use nightly feature, otherwise use pre-compiled binary
---@type boolean
local is_home = require("config.global").is_home

---@type boolean|string
local build = is_home and "cargo build --release" or false

---@type boolean|string
local version = is_home and false or "*"

---@type LazySpec
local spec = {
    "saghen/blink.cmp",
    build = build,
    version = version,
    lazy = false,
    dependencies = require("plugins.blink-cmp.dependencies"),
    opts = require("plugins.blink-cmp.opts"),
    cond = cond,
    enabled = cond,
}

return spec
