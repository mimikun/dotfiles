---@module 'blink.cmp'
---@type blink.cmp.Config
local opts = {
    keymap = require("plugins.blink-cmp.opts.keymap"),
    -- TODO: it
    completion = require("plugins.blink-cmp.opts.completion"),
    fuzzy = require("plugins.blink-cmp.opts.fuzzy"),
    -- TODO: it
    sources = require("plugins.blink-cmp.opts.sources"),
    signature = require("plugins.blink-cmp.opts.signature"),
    snippets = require("plugins.blink-cmp.opts.snippets"),
    appearance = require("plugins.blink-cmp.opts.appearance"),
    cmdline = require("plugins.blink-cmp.opts.cmdline"),
    term = require("plugins.blink-cmp.opts.term"),
}

return opts
