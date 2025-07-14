---@module 'blink.cmp'
---@type blink.cmp.FuzzyConfig
local fuzzy = {
    implementation = "prefer_rust_with_warning",
    sorts = require("plugins.blink-cmp.opts.fuzzy.sorts"),
}

return fuzzy
