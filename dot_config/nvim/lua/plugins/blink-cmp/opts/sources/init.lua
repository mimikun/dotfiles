---@module 'blink.cmp'
---@type blink.cmp.SourceConfigPartial
local sources = {
    default = require("plugins.blink-cmp.opts.sources.default"),
    per_filetype = require("plugins.blink-cmp.opts.sources.per_filetype"),
    providers = require("plugins.blink-cmp.opts.sources.providers"),
}

return sources
