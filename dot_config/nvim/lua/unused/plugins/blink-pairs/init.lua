---@type boolean
local cond = false
--local cond = require("config.settings").use_blink_pairs

-- NOTE: if is_home, use nightly feature, otherwise use pre-compiled binary
---@type boolean
local is_home = require("config.global").is_home

---@type boolean|string
local build = is_home and "cargo build --release" or false

---@type boolean|string
local version = is_home and false or "*"

---@type LazySpec
local spec = {
    "saghen/blink.pairs",
    --lazy = false,
    version = version,
    build = build,
    event = "InsertEnter",
    dependencies = { "saghen/blink.download" },
    opts = require("plugins.blink-pairs.opts"),
    cond = cond,
    enabled = cond,
}

return spec
