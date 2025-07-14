---@module 'blink.cmp'
---@type blink.cmp.TermConfig
local term = {
    enabled = true,
    keymap = require("plugins.blink-cmp.opts.term.keymap"),
    completion = require("plugins.blink-cmp.opts.term.completion"),
}

return term
