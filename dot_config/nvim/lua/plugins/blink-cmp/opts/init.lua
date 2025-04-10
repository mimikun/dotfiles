---@module 'blink.cmp'
---@type blink.cmp.Config
local opts = {
    keymap = require("plugins.blink-cmp.opts.keymap"),
    snippets = { preset = "luasnip" },
    completion = require("plugins.blink-cmp.opts.completion"),
    --fuzzy = require("plugins.blink-cmp.opts.fuzzy"),
    sources = require("plugins.blink-cmp.opts.sources"),
    cmdline = require("plugins.blink-cmp.opts.cmdline"),
    term = require("plugins.blink-cmp.opts.term"),
}

return opts
