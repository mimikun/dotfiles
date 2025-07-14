---@module 'blink.cmp'
---@type blink.cmp.CompletionConfig
local completion = {
    trigger = require("plugins.blink-cmp.opts.completion.trigger"),
    list = require("plugins.blink-cmp.opts.completion.list"),
    menu = require("plugins.blink-cmp.opts.completion.menu"),
    documentation = require("plugins.blink-cmp.opts.completion.documentation"),
    ghost_text = require("plugins.blink-cmp.opts.completion.ghost_text"),
}

return completion
